class IncidentesController < ApplicationController
  before_action :set_incidente, only: [:show, :edit, :update, :destroy]
  before_filter :colecoes
  load_and_authorize_resource :class=>"Incidente", except: :create

  # GET /incidentes
  # GET /incidentes.json
  def index
    #@incidentes = Incidente.all
    #@q = Incidente.ransack(params[:q])
    @incidentes = Incidente.accessible_by(current_ability).order('data_inicio DESC')
  end

  # GET /incidentes/1data_inicio DESC GET /incidentes/1.json
  def show
  end

  # GET /incidentes/new
  def new
    @incidente = Incidente.new
  end

  def autocomplete_tipo_incidente_descricao
    term = params[:term]
    tipo_incidentes = TipoIncidente.where('descricao ilike ?',"%#{term}%").order(:descricao).all
    render :json => tipo_incidentes.map { |tipo_incidente| {:id => tipo_incidente.id,:label => tipo_incidente.descricao, :value => tipo_incidente.descricao} }
  end

  # GET /incidentes/1/edit
  def edit
  end

  # POST /incidentes
  # POST /incidentes.json
  def create
    @incidente = Incidente.new(incidente_params)

    respond_to do |format|
      if @incidente.save
        flash[:success] = @@msgs
        format.html { redirect_to @incidente, notice: @@msgs }
        format.json { render :show, status: :created, location: @incidente }
      else
        flash[:danger] = @@msge
        format.html { render :new }
        format.json { render json: @incidente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidentes/1
  # PATCH/PUT /incidentes/1.json
  def update
    respond_to do |format|
      if @incidente.update(incidente_params)
        flash[:success] = @@msgs
        format.html { redirect_to @incidente, notice: @@msgs }
        format.json { render :show, status: :ok, location: @incidente }
      else
        flash[:danger] = @@msge
        format.html { render :edit }
        format.json { render json: @incidente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidentes/1
  # DELETE /incidentes/1.json
  def destroy
    if @incidente.destroy
      flash[:success] = @@msgs
      respond_to do |format|
        format.html { redirect_to incidentes_url, notice: @@msgs }
        format.json { head :no_content }
      end
    else
      flash[:danger] = @@msge
      respond_to do |format|
        format.html { redirect_to incidentes_url, notice: @@msge }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incidente
      @incidente = Incidente.accessible_by(current_ability).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incidente_params
      params.require(:incidente).permit(:descricao, :data_inicio, :data_fim, :previsao_fim, :status, :observacoes, :tipo_incidente_id)
    end

    def colecoes
      @tipo_incidentes_cadastrados = TipoIncidente.order('descricao ASC').all
    end
end