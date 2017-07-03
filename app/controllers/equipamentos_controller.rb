class EquipamentosController < ApplicationController
  before_action :set_equipamento, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :class=>"Equipamento", except: :create

  # GET /equipamentos
  # GET /equipamentos.json
  def index
    #@equipamentos = Equipamento.all
    #@q = Equipamento.ransack(params[:q])
    @equipamentos = Equipamento.accessible_by(current_ability).order('detalhes_equipamento_id ASC')
  end

  # GET /equipamentos/1
  # GET /equipamentos/1.json
  def show
  end

  # GET /equipamentos/new
  def new
    @equipamento = Equipamento.new
  end

  # GET /equipamentos/1/edit
  def edit
  end

  # POST /equipamentos
  # POST /equipamentos.json
  def create
    @equipamento = Equipamento.new(equipamento_params)

    respond_to do |format|
      if @equipamento.save
        format.html { redirect_to @equipamento, notice: @@msgs }
        format.json { render :show, status: :created, location: @equipamento }
      else
        format.html { render :new }
        format.json { render json: @equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipamentos/1
  # PATCH/PUT /equipamentos/1.json
  def update
    respond_to do |format|
      if @equipamento.update(equipamento_params)
        format.html { redirect_to @equipamento, notice: @@msgs }
        format.json { render :show, status: :ok, location: @equipamento }
      else
        format.html { render :edit }
        format.json { render json: @equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipamentos/1
  # DELETE /equipamentos/1.json
  def destroy
    if @equipamento.destroy
      respond_to do |format|
        format.html { redirect_to equipamentos_url, notice: @@msgs }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to equipamentos_url, notice: @@msge }
        format.json { head :no_content }
      end
    end
  end

  def autocomplete_departamento_nome
    term = params[:term]
    departamentos = Departamento.where('sigla ilike ?',"%#{term}%").order(:sigla).all
    render :json => departamentos.map { |departamento| {:id => departamento.id,:label => departamento.sigla, :value => departamento.sigla} }
  end

  def autocomplete_escola_nome
    term = params[:term]
    escolas = Escola.where('nome ilike ?',"%#{term}%").order(:nome).all
    render :json => escolas.map { |escola| {:id => escola.id,:label => escola.nome, :value => escola.nome} }
  end

  def autocomplete_orgao_nome
    term = params[:term]
    orgaos = Orgao.where('nome ilike ?',"%#{term}%").order(:nome).all
    render :json => orgaos.map { |orgao| {:id => orgao.id,:label => orgao.nome, :value => orgao.nome} }
  end

  def autocomplete_departamento_emprestimo_nome
    term = params[:term]
    departamentos_emprestimos = Departamento.where('sigla ilike ?',"%#{term}%").order(:sigla).all
    render :json => departamentos_emprestimos.map { |departamento_emprestimo| {:id => departamento_emprestimo.id,:label => departamento_emprestimo.sigla, :value => departamento_emprestimo.sigla} }
  end

  def autocomplete_detalhes_equipamento_nome
    term = params[:term]
    equipamentos = DetalhesEquipamento.where('modelo ilike ?',"%#{term}%").order(:modelo).all
    render :json => equipamentos.map { |equipamento| {:id => equipamento.id,:label => equipamento.modelo, :value => equipamento.modelo} }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipamento
      @equipamento = Equipamento.accessible_by(current_ability).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipamento_params
      params.require(:equipamento).permit(:nome, :patrimonio, :quantidade, :detalhes_equipamento_id, 
                                          :status_equipamento_id, :departamento_id, :situacao, 
                                          :data_patrimonio, :responsavel, :departamento_emprestimo_id,
                                          :especificacoes, :descricao, :serie, :mac, :data_aquisicao,
                                          :forma_aquisicao, :doador, :proprietario, :escola_id,
                                          :orgao_id, :nota, :detalhes_equipamento_nome,
                                          :departamento_nome, :departamento_emprestimo_nome, :escola_nome, 
                                          :orgao_nome)
    end
end
