class AgendasController < ApplicationController
  before_action :set_agenda, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :class=>"Agenda", except: :create

  # GET /agendas
  # GET /agendas.json
  def index
    @agendas = Agenda.accessible_by(current_ability)
  end

  # GET /agendas/1
  # GET /agendas/1.json
  def show
  end

  # GET /agendas/new
  def new
    @agenda = Agenda.new
  end

  # GET /agendas/1/edit
  def edit
  end

  # POST /agendas
  # POST /agendas.json
  def create
    @agenda = Agenda.new(agenda_params)

    respond_to do |format|
      if @agenda.save
        flash[:success] = @@msgs
        format.html { redirect_to @agenda, success: @@msgs }
        format.json { render :show, status: :created, location: @agenda }
      else
        flash[:danger] = @@msge
        format.html { render :new }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agendas/1
  # PATCH/PUT /agendas/1.json
  def update
    respond_to do |format|
      if @agenda.update(agenda_params)
        flash[:success] = @@msgs
        format.html { redirect_to @agenda, notice: @@msgs }
        format.json { render :show, status: :ok, location: @agenda }
      else
        flash[:danger] = @@msge
        format.html { render :edit }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agendas/1
  # DELETE /agendas/1.json
  def destroy
    @agenda.destroy
    respond_to do |format|
      flash[:success] = @@msgs
      format.html { redirect_to agendas_url, success: @@msgs }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agenda
      @agenda = Agenda.accessible_by(current_ability).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agenda_params
      params.require(:agenda).permit(:tipo, :titulo, :informacoes, :data_hora, :publicado, :user_id)
    end
end
