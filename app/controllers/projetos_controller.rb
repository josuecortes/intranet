class ProjetosController < ApplicationController
  before_action :set_projeto, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :class=>"Projeto", except: :create

  # GET /projetos
  # GET /projetos.json
  def index
    @projetos = Projeto.accessible_by(current_ability).order('created_at DESC')
  end

  # GET /projetos/1
  # GET /projetos/1.json
  def show
  end

  # GET /projetos/new
  def new
    @projeto = Projeto.new
  end

  # GET /projetos/1/edit
  def edit
  end

  # POST /projetos
  # POST /projetos.json
  def create
    @projeto = Projeto.new(projeto_params)

    respond_to do |format|
      if @projeto.save
        flash[:success] = @@msgs
        format.html { redirect_to @projeto, notice: @@msgs }
        format.json { render :show, status: :created, location: @projeto }
      else
        flash[:danger] = @@msge
        format.html { render :new }
        format.json { render json: @projeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projetos/1
  # PATCH/PUT /projetos/1.json
  def update
    respond_to do |format|
      if @projeto.update(projeto_params)
        flash[:success] = @@msgs
        format.html { redirect_to @projeto, notice: @@msgs }
        format.json { render :show, status: :ok, location: @projeto }
      else
        flash[:danger] = @@msge
        format.html { render :edit }
        format.json { render json: @projeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projetos/1
  # DELETE /projetos/1.json
  def destroy
    if @projeto.destroy
      flash[:success] = @@msgs
    else
      flash[:danger] = @@msge
    end
    respond_to do |format|
      format.html { redirect_to projetos_url, notice: @@msgs }
      format.json { head :no_content }
    end
  end


  def participantes
    @projeto = Projeto.accessible_by(current_ability).find(params[:projeto_id])
    if @projeto.user_ids.blank?
      @usuarios_fora = User.all
    else
      @usuarios_fora = User.where('id not in (?)', @projeto.user_ids).all
    end
  end

  def salvar_participante
    @projeto = Projeto.accessible_by(current_ability).find(params[:projeto_id])
    @user = User.find(params[:user_id])

    if @user.adicionar_participante_no_projeto(@projeto)
      flash[:success] = @@msgs
      redirect_to projeto_participantes_url(@projeto)
    else
      flash[:danger] = @@msge
      redirect_to  projeto_participantes_url(@celula)
    end
  end

  def remover_participante
    @projeto = Projeto.accessible_by(current_ability).find(params[:projeto_id])
    @user = User.find(params[:user_id])

    if @user.remover_participante_do_projeto(@projeto)
      flash[:success] = @@msgs
      redirect_to projeto_participantes_url(@projeto)
    else
      flash[:danger] = @@msge
      redirect_to  projeto_participantes_url(@celula)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projeto
      @projeto = Projeto.accessible_by(current_ability).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projeto_params
      params.require(:projeto).permit(:departamento_id, :local, :metodo, :custo, :data_inicial, :data_final, :objetivo, :nome, 
                                      :resumo, :status, :publicado, :user_id, {:user_ids => []} )
    end
end
