class RequestDestiniesController < ApplicationController
  before_action :set_request_destiny, only: [:show, :edit, :update, :destroy]
  before_filter :colecoes
  # GET /request_destinies
  # GET /request_destinies.json
  def index
    @request_destinies = RequestDestiny.all
  end

  def index
    @request = Request.find(params[:request_id])
    @request_destinies = @request.request_destinies
    @request_destiny = @request.request_destinies.new
  end

  # GET /request_destinies/1
  # GET /request_destinies/1.json
  def show
  end

  # GET /request_destinies/new
  def new
    @request_destiny = RequestDestiny.new
  end

  # GET /request_destinies/1/edit
  def edit
  end

  # POST /request_destinies
  # POST /request_destinies.json
  def create
    @request = Request.find(params[:request_id])
    @request_destinies = @request.request_destinies
    @request_destiny = RequestDestiny.new(request_destiny_params)

    respond_to do |format|
      if @request_destiny.save
        flash[:success] = @@msgs
        format.html { redirect_to request_request_destinies_path(@request), notice: 'Destino Adicionado a Requisição' }
        format.json { render :show, status: :created, location: @request_destiny }
      else
        flash[:danger] = @@msge
        format.html { render :index }
        format.json { render json: @request_destiny.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_destinies/1
  # PATCH/PUT /request_destinies/1.json
  def update
    respond_to do |format|
      if @request_destiny.update(request_destiny_params)
        flash[:success] = @@msgs
        format.html { redirect_to @request_destiny, notice: 'Request destiny was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_destiny }
      else
        flash[:danger] = @@msge
        format.html { render :edit }
        format.json { render json: @request_destiny.errors, status: :unprocessable_entity }
      end
    end
  end

  def autocomplete_destiny_nome
    @request = Request.find(params[:request_id])

    if @request.tipo == "VIAGEM"
      d = Destiny.where(:tipo=>"VIAGEM")
      term = params[:term]
      destinos = d.where('nome ilike ?',"%#{term}%").order(:nome).all
      render :json => destinos.map { |destino| {:id => destino.id,:label => destino.nome, :value => destino.nome} }
    else
      d = Destiny.where(:tipo=>"DESLOCAMENTO URBANO")
      term = params[:term]
      destinos = d.where('nome ilike ?',"%#{term}%").order(:nome).all
      render :json => destinos.map { |destino| {:id => destino.id,:label => destino.nome, :value => destino.nome} }
    end
    
  end


  # DELETE /request_destinies/1
  # DELETE /request_destinies/1.json
  def destroy
    if @request_destiny.destroy
      flash[:success] = 'Destino removido com sucesso.'
      respond_to do |format|
        format.html { redirect_to request_request_destinies_url(@request), notice: 'Destino removido com sucesso.' }
        format.json { head :no_content }
      end
    else
      flash[:danger] = 'Erro ao remover destino.'
      respond_to do |format|
        format.html { redirect_to request_request_destinies_url(@request), notice: 'Erro ao remover destino.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_destiny
      @request = Request.find(params[:request_id])
      @request_destinies = @request.request_destinies
      @request_destiny = @request.request_destinies.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_destiny_params
      params.require(:request_destiny).permit(:request_id, :destiny_id, :endereco)
    end

    def colecoes
      @lista_destinos = Destiny.where(:tipo=>"VIAGEM")
    end
end
