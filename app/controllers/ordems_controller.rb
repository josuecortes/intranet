class OrdemsController < ApplicationController
  before_action :set_ordem, only: [:show, :edit, :update, :destroy, :fechar_ordem, :aguardando_ordem, :concluir_ordem]
  before_action :pegar_todos, only: [:index, :em_atendimento, :concluidos, :aguardando, :fechados]
  before_filter :colecoes
  load_and_authorize_resource :class=>"Ordem", except: :create
  # GET /ordems
  # GET /ordems.json
  def index
  end

  # GET /ordems/1
  # GET /ordems/1.json
  def show
  end

  # GET /ordems/new
  def new

    @chamado = Chamado.find(params[:chamado_id])
    @ordem = @chamado.build_ordem
    #@ordem = Ordem.new
  end

  # GET /ordems/1/edit
  def edit
  end

  # POST /ordems
  # POST /ordems.json
  def create

    @chamado = Chamado.find(params[:chamado_id])
    @ordem = @chamado.build_ordem(ordem_params)

    respond_to do |format|
      if @ordem.save
        flash[:success] = @@msgs
        format.html { redirect_to ordem_path(@ordem), notice: @@msgs }
        format.json { render :show, status: :created, location: @ordem }
      else
        flash[:danger] = @@msge
        format.html { render :new }
        format.json { render json: @ordem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordems/1
  # PATCH/PUT /ordems/1.json
  def update
    respond_to do |format|
      if @ordem.update(ordem_params)
        flash[:success] = @@msgs
        format.html { redirect_to @ordem, notice: @@msgs }
        format.json { render :show, status: :ok, location: @ordem }
      else
        flash[:danger] = @@msge
        format.html { render :edit }
        format.json { render json: @ordem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordems/1
  # DELETE /ordems/1.json
  def destroy

    if @ordem.status == "ABERTO" 
      if @ordem.destroy
        flash[:info] = 'Ordem Apagada.'
        respond_to do |format|
          format.html { redirect_to ordems_url, notice: 'Ordem Apagada.' }
          format.json { head :no_content }
        end
      else
        flash[:info] = 'Erro ao apagar a Ordem.'
        respond_to do |format|
          format.html { redirect_to ordems_url, notice: 'Erro ao apagar a Ordem.' }
          format.json { head :no_content }
        end
      end
    else
      respond_to do |format|
        lash[:info] = 'Erro ao apagar a Ordem.'
        format.html { redirect_to ordems_url, notice: 'Essa Ordem não pode ser apagada.' }
        format.json { head :no_content }
      end
    end
     
  end

  def fechar_ordem

  end

  def aguardando_ordem

  end

  def concluir_ordem

  end

  def liberar_equipamento
    @ordem = Ordem.find(params[:ordem_id])
    if current_user != @ordem.cliente
      redirect_to ordems_url, notice: 'Algo estranho aconteceu'
    else
      if @ordem.status == 'ABERTO'
        @ordem.status = 'EM ATENDIMENTO'
        @ordem.data_status_em_atendimento = DateTime.now
        if @ordem.save
          redirect_to em_atendimento_ordems_url, notice: 'Agora o Tecnico pode Levar o Equipamento'
        else
          redirect_to ordems_url, notice: 'Nao conseguimos liberar o equipamento'
        end
      else
        redirect_to chamados_url, notice: 'Esta OS nao esta com o status ABERTO'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordem
      if !params[:id].blank?
        @ordem = Ordem.find(params[:id])
      else
        @ordem = Ordem.find(params[:ordem_id])
      end
    end

    def pegar_todos
      # @chamados = Chamado.all
      # @q = Chamado.ransack(params[:q])
      # @chamados = @q.result.accessible_by(current_ability).order('created_at DESC').paginate(:page => params[:page], :per_page => @@per_page)
      # @abertos = @q.result.accessible_by(current_ability).order('data_status_aberto DESC').where("status = ?", "ABERTO").paginate(:page => params[:page], :per_page => @@per_page)
      # @atendimentos = @q.result.accessible_by(current_ability).order('data_status_em_atendimento ASC').where("status = ?", "EM ATENDIMENTO").paginate(:page => params[:page], :per_page => @@per_page)
      # @concluidos = @q.result.accessible_by(current_ability).order('data_status_concluido DESC').where("status = ?", "CONCLUIDO").paginate(:page => params[:page], :per_page => @@per_page)
      # @cancelados = @q.result.accessible_by(current_ability).order('data_status_cancelado DESC').where("status = ?", "CANCELADO").paginate(:page => params[:page], :per_page => @@per_page)
      # @fechados = @q.result.accessible_by(current_ability).order('data_status_fechado DESC').where("status = ?", "FECHADO").paginate(:page => params[:page], :per_page => @@per_page)

      @ordens = Ordem.accessible_by(current_ability).order('created_at DESC')
      @abertas = Ordem.accessible_by(current_ability).order('created_at ASC').where("status = ?", "ABERTO")
      @atendimentos = Ordem.accessible_by(current_ability).order('created_at ASC').where("status = ?", "EM ATENDIMENTO")
      @concluidas = Ordem.accessible_by(current_ability).order('created_at DESC').where("status = ?", "CONCLUIDO")
      @aguardando = Ordem.accessible_by(current_ability).order('created_at ASC').where("status = ?", "AGUARDANDO")
      @fechadas = Ordem.accessible_by(current_ability).order('created_at DESC').where("status = ?", "FECHADO")


    end

    def colecoes
      #@problemas_cadastrados = Problema.order('descricao ASC').all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordem_params
      params.require(:ordem).permit(:cabecalho, :historico, :status, :data_status_aberto, :data_status_em_atendimento, :data_status_concluido, :data_status_aguardando, :data_status_fechado, :user_id, :cliente_id, :departamento_id, :tipo_equipamento, :especificacoes, :condicoes, :problema, :acoes, :conversa)
    end
end
