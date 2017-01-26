class EtapasController < ApplicationController
  before_action :set_etapa, only: [:show, :edit, :update, :destroy]

  # GET /etapas
  # GET /etapas.json
  def index
    @projeto = Projeto.find(params[:projeto_id])
    @etapas = @projeto.etapas
  end

  # GET /etapas/1
  # GET /etapas/1.json
  def show
  end

  # GET /etapas/new
  def new
    @projeto = Projeto.find(params[:projeto_id])
    @etapa = @projeto.etapas.build
  end

  # GET /etapas/1/edit
  def edit
  end

  # POST /etapas
  # POST /etapas.json
  def create

    @projeto = Projeto.find(params[:projeto_id])
    @etapa = @projeto.etapas.build(etapa_params)

    respond_to do |format|
      if @etapa.save!
        format.html { redirect_to projeto_etapa_path(@projeto, @etapa), notice: 'Etapa was successfully created.' }
        format.json { render :show, status: :created, location: @etapa }
      else
        format.html { render :new }
        format.json { render json: @etapa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etapas/1
  # PATCH/PUT /etapas/1.json
  def update
    respond_to do |format|
      if @etapa.update(etapa_params)
        format.html { redirect_to projeto_etapa_path(@projeto,@etapa), notice: 'Etapa was successfully updated.' }
        format.json { render :show, status: :ok, location: @etapa }
      else
        format.html { render :edit }
        format.json { render json: @etapa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etapas/1
  # DELETE /etapas/1.json
  def destroy
    @etapa.destroy
    respond_to do |format|
      format.html { redirect_to etapas_url, notice: 'Etapa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etapa
      @projeto = Projeto.find(params[:projeto_id])
      @etapa = @projeto.etapas.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def etapa_params
      params.require(:etapa).permit(:nome, :data_inicio, :data_final, :status, :projeto_id, :user_ids => [])
    end

end
