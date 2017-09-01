class DetalhesEquipamentosController < ApplicationController
  before_action :set_detalhes_equipamento, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :class=>"DetalhesEquipamento", except: :create

  # GET /detalhes_equipamentos
  # GET /detalhes_equipamentos.json
  def index
    #@detalhes_equipamentos = DetalhesEquipamento.all
    #@q = DetalhesEquipamento.ransack(params[:q])
    @detalhes_equipamentos = DetalhesEquipamento.accessible_by(current_ability).order('modelo ASC')
  end

  # GET /detalhes_equipamentos/1
  # GET /detalhes_equipamentos/1.json
  def show
  end

  # GET /detalhes_equipamentos/new
  def new
    @detalhes_equipamento = DetalhesEquipamento.new
  end

  # GET /detalhes_equipamentos/1/edit
  def edit
  end

  # POST /detalhes_equipamentos
  # POST /detalhes_equipamentos.json
  def create
    @detalhes_equipamento = DetalhesEquipamento.new(detalhes_equipamento_params)

    respond_to do |format|
      if @detalhes_equipamento.save
        flash[:success] = @@msgs
        format.html { redirect_to @detalhes_equipamento, notice: @@msgs }
        format.json { render :show, status: :created, location: @detalhes_equipamento }
      else
        flash[:danger] = @@msge
        format.html { render :new }
        format.json { render json: @detalhes_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalhes_equipamentos/1
  # PATCH/PUT /detalhes_equipamentos/1.json
  def update
    respond_to do |format|
      if @detalhes_equipamento.update(detalhes_equipamento_params)
        flash[:success] = @@msgs
        format.html { redirect_to @detalhes_equipamento, notice: @@msgs }
        format.json { render :show, status: :ok, location: @detalhes_equipamento }
      else
        flash[:danger] = @@msge
        format.html { render :edit }
        format.json { render json: @detalhes_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalhes_equipamentos/1
  # DELETE /detalhes_equipamentos/1.json
  def destroy
    if @detalhes_equipamento.destroy
      flash[:success] = @@msgs
      respond_to do |format|
        format.html { redirect_to detalhes_equipamentos_url, notice: @@msgs }
        format.json { head :no_content }
      end
    else
      flash[:danger] = @@msge
      respond_to do |format|
        format.html { redirect_to detalhes_equipamentos_url, notice: @@msge }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalhes_equipamento
      @detalhes_equipamento = DetalhesEquipamento.accessible_by(current_ability).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalhes_equipamento_params
      params.require(:detalhes_equipamento).permit(:modelo, :configuracao, :tipo_equipamento_id)
    end
end
