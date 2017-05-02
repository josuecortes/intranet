class ChamadosController < ApplicationController
  before_action :set_chamado, only: [:show, :edit, :update, :destroy, :fechar_chamado, :cancelar_chamado, :concluir_chamado]
  before_action :pegar_todos, only: [:index, :em_atendimento, :concluidos, :cancelados, :fechados]
  before_filter :colecoes
  load_and_authorize_resource :class=>"Chamado", except: :create

  # GET /chamados
  # GET /chamados.json
  def index

  end

  def em_atendimento

  end

  def concluidos

  end

  def cancelados

  end

  def fechados

  end

  # GET /chamados/1
  # GET /chamados/1.json
  def show
  end

  # GET /chamados/new
  def new
    @chamado = Chamado.new
  end

  def autocomplete_problema_descricao
    term = params[:term]
    problemas = Problema.where('descricao ilike ?',"%#{term}%").order(:descricao).all
    render :json => problemas.map { |problema| {:id => problema.id,:label => problema.descricao, :value => problema.descricao} }
  end

  # GET /chamados/1/edit
  def edit
  end

  # POST /chamados
  # POST /chamados.json
  def create
    @chamado = Chamado.new(chamado_params)

    respond_to do |format|
      if @chamado.save
        format.html { redirect_to @chamado, notice: @@msgs }
        format.json { render :show, status: :created, location: @chamado }
      else
        format.html { render :new }
        format.json { render json: @chamado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chamados/1
  # PATCH/PUT /chamados/1.json
  def update
    respond_to do |format|
      if @chamado.update(chamado_params)
        format.html { redirect_to @chamado, notice: @@msgs }
        format.json { render :show, status: :ok, location: @chamado }
      else
        if @chamado.status == "ABERTO"
          format.html { render :edit }
          format.json { render json: @chamado.errors, status: :unprocessable_entity }
        end

        if @chamado.status == "CANCELADO"
          @chamado.status = Chamado.where("id = ?", @chamado.id).first.status
          format.html { render :cancelar_chamado }
          format.json { render json: @chamado.errors, status: :unprocessable_entity }
        end

        if @chamado.status == "FECHADO"
          @chamado.status = Chamado.where("id = ?", @chamado.id).first.status
          format.html { render :fechar_chamado }
          format.json { render json: @chamado.errors, status: :unprocessable_entity }
        end

        if @chamado.status == "CONCLUIDO"
          @chamado.status = Chamado.where("id = ?", @chamado.id).first.status
          format.html { render :concluir_chamado }
          format.json { render json: @chamado.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /chamados/1
  # DELETE /chamados/1.json
  def destroy
    if @chamado.destroy
      respond_to do |format|
        format.html { redirect_to chamados_url, notice: @@msgs }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to detalhes_equipamentos_url, notice: @@msge }
        format.json { head :no_content }
      end
    end
  end

  def fechar_chamado

  end

  def cancelar_chamado

  end

  def concluir_chamado

  end

  def pegar_chamado
    if current_user == @usuario_atual and @usuario_atual.e_tecnico
      redirect_to chamados_url, notice: 'Algo estranho aconteceu'
    else
      @chamado = Chamado.find(params[:chamado_id])
      if @chamado.status == 'ABERTO'
        @usuario = User.find(params[:usuario_id])
        @chamado.tecnico = @usuario
        @chamado.status = 'EM ATENDIMENTO'
        @chamado.data_status_em_atendimento = DateTime.now
        if @chamado.save
          redirect_to em_atendimento_chamados_url, notice: 'Agora voce e o responsavel pelo chamado'
        else
          redirect_to chamados_url, notice: 'Nao conseguimos torna-lo responsavel pelo chamado'
        end
      else
        redirect_to chamados_url, notice: 'Este Chamado nao esta com o status ABERTO'
      end
    end
  end

  def concluir_chamado

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chamado
      if !params[:id].blank?
        @chamado = Chamado.find(params[:id])
      else
        @chamado = Chamado.find(params[:chamado_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chamado_params
      params.require(:chamado).permit(:problema_id, :tecnico_id, :observacoes_usuario, :user_id,
                                      :status, :data_status_aberto, :data_status_fechado, :data_status_em_atendimento,
                                      :data_status_concluido, :parecer_preliminar_tecnico, :parecer_final_tecnico,
                                      :motivo_cancelamento, :avaliacao_usuario, :nivel_satisfacao_usuario,
                                      :data_status_cancelado)
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

      @chamados = Chamado.accessible_by(current_ability).order('created_at DESC')
      @abertos = Chamado.accessible_by(current_ability).order('created_at ASC').where("status = ?", "ABERTO")
      @atendimentos = Chamado.accessible_by(current_ability).order('created_at ASC').where("status = ?", "EM ATENDIMENTO")
      @concluidos = Chamado.accessible_by(current_ability).order('created_at DESC').where("status = ?", "CONCLUIDO")
      @cancelados = Chamado.accessible_by(current_ability).order('created_at ASC').where("status = ?", "CANCELADO")
      @fechados = Chamado.accessible_by(current_ability).order('created_at DESC').where("status = ?", "FECHADO")


    end

    def colecoes
      @problemas_cadastrados = Problema.order('descricao ASC').all
    end

end
