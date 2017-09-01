class RequestPassengersController < ApplicationController
  before_action :set_request_passenger, only: [:show, :edit, :update, :destroy]

  # GET /request_passengers
  # GET /request_passengers.json
  def index
    @request = Request.find(params[:request_id])
    @request_passengers = @request.request_passengers
    @request_passenger = @request.request_passengers.new
  end

  # GET /request_passengers/1
  # GET /request_passengers/1.json
  def show
  end

  # GET /request_passengers/new
  def new
    @request_passenger = RequestPassenger.new
  end

  # GET /request_passengers/1/edit
  def edit
  end

  # POST /request_passengers
  # POST /request_passengers.json
  def create
    @request = Request.find(params[:request_id])
    @request_passengers = @request.request_passengers
    @request_passenger = RequestPassenger.new(request_passenger_params)

    respond_to do |format|
      if @request_passenger.save
        flash[:success] = @@msgs
        format.html { redirect_to request_request_passengers_path(@request), notice: 'Passageiro Adicionado a Requisição' }
        format.json { render :index, status: :created, location: @request_passenger }
      else
        flash[:danger] = @@msge
        format.html { render :index }
        format.json { render json: @request_passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_passengers/1
  # PATCH/PUT /request_passengers/1.json
  def update
    respond_to do |format|
      if @request_passenger.update(request_passenger_params)
        flash[:success] = @@msgs
        format.html { redirect_to @request_passenger, notice: 'Request passenger was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_passenger }
      else
        flash[:danger] = @@msge
        format.html { render :edit }
        format.json { render json: @request_passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  def autocomplete_passenger_nome
    term = params[:term]
    passageiros = Passenger.where('nome ilike ?',"%#{term}%").order(:nome).all
    render :json => passageiros.map { |passageiro| {:id => passageiro.id,:label => passageiro.nome, :value => passageiro.nome} }
  end

  # DELETE /request_passengers/1
  # DELETE /request_passengers/1.json
  def destroy
    
    if @request_passenger.destroy
      respond_to do |format|
        flash[:success] = 'Passageiro removido com sucesso.'
        format.html { redirect_to request_request_passengers_url(@request), notice: 'Passageiro removido com sucesso.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        flash[:danger] = 'Erro ao remover passageiro.'
        format.html { redirect_to request_request_passengers_url(@request), notice: 'Erro ao remover passageiro.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_passenger
      @request = Request.find(params[:request_id])
      @request_passengers = @request.request_passengers
      @request_passenger = @request.request_passengers.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_passenger_params
      params.require(:request_passenger).permit(:request_id, :passenger_id)
    end
end
