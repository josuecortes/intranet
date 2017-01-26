class VisitaController < ApplicationController
  before_action :set_visitum, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :class=>"Visitum", except: :create

  # GET /visita
  # GET /visita.json
  def index
    #@visita = Visitum.all
  end

  # GET /visita/1
  # GET /visita/1.json
  def show
  end

  # GET /visita/new
  def new
    @visitante = Visitante.find(params[:visitante_id])
    
    if @visitante.pode_dar_entrada == false
      flash[:info] = 'Nao pode'
      redirect_to visitante_path(@visitante)
    else
      @visitum = @visitante.visitas.build
    end

  end

  # GET /visita/1/edit
  def edit
  end

  # POST /visita
  # POST /visita.json
  def create

    @visitante = Visitante.find(params[:visitante_id])
    @visitum = @visitante.visitas.build(visitum_params)

    respond_to do |format|
      if @visitum.save
        format.html { redirect_to visitante_url(@visitum.visitante), notice: @@msgs }
        format.json { render :show, status: :created, location: @visitum }
      else
        format.html { render :new }
        format.json { render json: @visitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visita/1
  # PATCH/PUT /visita/1.json
  def update
    respond_to do |format|
      if @visitum.update(visitum_params)
        format.html { redirect_to visitante_url(@visitum.visitante), notice: @@msgs }
        format.json { render :show, status: :ok, location: @visitum }
      else
        format.html { render :edit }
        format.json { render json: @visitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visita/1
  # DELETE /visita/1.json
  def destroy
    #@visitum.destroy
    #respond_to do |format|
      #format.html { redirect_to visita_url, notice: 'Visitum was successfully destroyed.' }
      #format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitum
      @visitante = Visitante.find(params[:visitante_id])
      @visitum = @visitante.visitas.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitum_params
      params.require(:visitum).permit(:visitante_id, :departamento_id, :observacoes, :entrada, :saida, :status)
    end
end
