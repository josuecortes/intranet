class VisitantesController < ApplicationController
  before_action :set_visitante, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :class=>"Visitante", except: :create

  # GET /visitantes
  # GET /visitantes.json
  def index
    @visitantes = Visitante.all
  end

  # GET /visitantes/1
  # GET /visitantes/1.json
  def show
  end

  # GET /visitantes/new
  def new
    @visitante = Visitante.new
  end

  # GET /visitantes/1/edit
  def edit
  end

  # POST /visitantes
  # POST /visitantes.json
  def create
    @visitante = Visitante.new(visitante_params)

    respond_to do |format|
      if @visitante.save
        format.html { redirect_to @visitante, notice: @@msgs }
        format.json { render :show, status: :created, location: @visitante }
      else
        format.html { render :new }
        format.json { render json: @visitante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitantes/1
  # PATCH/PUT /visitantes/1.json
  def update
    respond_to do |format|
      if @visitante.update(visitante_params)
        format.html { redirect_to @visitante, notice: @@msgs }
        format.json { render :show, status: :ok, location: @visitante }
      else
        format.html { render :edit }
        format.json { render json: @visitante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitantes/1
  # DELETE /visitantes/1.json
  def destroy
    @visitante.destroy
    respond_to do |format|
      format.html { redirect_to visitantes_url, notice: @@msgs }
      format.json { head :no_content }
    end
  end

  def autocomplete_departamento_nome
    term = params[:term]
    departamentos = Departamento.where('sigla ilike ?',"%#{term}%").order(:sigla).all
    render :json => departamentos.map { |departamento| {:id => departamento.id,:label => departamento.sigla, :value => departamento.sigla} }
  end

  def entrada
    @visitante = Visitante.find(params[:visitante_id])
    @id = @visitante.id
    @visitum = Visitum.new

  end

  def salvar_entrada
    @visitum = Visitum.new(visitum_params)
    @visitante = Visitante.find(@visitum.visitante_id)
    @id = @visitum.visitante_id    

    respond_to do |format|
      if @visitum.save
        format.html { redirect_to visitante_url(@visitante), notice: @@msgs }
        format.json { render :show, status: :created, location: @visitante }
      else
        format.html { render :entrada}
        
      end
    end

  end

  def saida
    @visitante = Visitante.find(params[:visitante_id])
    @id = @visitante.id
    @visitum = Visitum.find(params[:visita_id])
    @saida = @visitum.id
  end

  def salvar_saida

    @visitum = Visitum.find(params[:visita_id])

    respond_to do |format|
      if @visitum.update(visitum_params)
        
        format.html { redirect_to visitante_url(@visitante), notice: @@msgs }
        format.json { render :show, status: :created, location: @visitante }
      else
        
        @visitante = Visitante.find(@visitum.visitante_id)
        @id = @visitum.visitante_id      

        format.html { render :saida }

      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitante
      @visitante = Visitante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitante_params
      params.require(:visitante).permit(:nome, :rg, :cpf)
    end

    def visitum_params
      params.require(:visitum).permit(:visitante_id, :departamento_id, :observacoes, :entrada, :saida, :status)
    end


end
