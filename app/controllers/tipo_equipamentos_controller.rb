class TipoEquipamentosController < ApplicationController
  before_action :set_tipo_equipamento, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :class=>"TipoEquipamento", except: :create

  # GET /tipo_equipamentos
  # GET /tipo_equipamentos.json
  def index
    #@tipo_equipamentos = TipoEquipamento.all
    #@q = TipoEquipamento.ransack(params[:q])
    @tipo_equipamentos = TipoEquipamento.accessible_by(current_ability).order('tipo ASC')
  end

  # GET /tipo_equipamentos/1
  # GET /tipo_equipamentos/1.json
  def show
  end

  # GET /tipo_equipamentos/new
  def new
    @tipo_equipamento = TipoEquipamento.new
  end

  # GET /tipo_equipamentos/1/edit
  def edit
  end

  # POST /tipo_equipamentos
  # POST /tipo_equipamentos.json
  def create
    @tipo_equipamento = TipoEquipamento.new(tipo_equipamento_params)

    respond_to do |format|
      if @tipo_equipamento.save
        format.html { redirect_to @tipo_equipamento, notice: @@msgs }
        format.json { render :show, status: :created, location: @tipo_equipamento }
      else
        format.html { render :new }
        format.json { render json: @tipo_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_equipamentos/1
  # PATCH/PUT /tipo_equipamentos/1.json
  def update
    respond_to do |format|
      if @tipo_equipamento.update(tipo_equipamento_params)
        format.html { redirect_to @tipo_equipamento, notice: @@msgs }
        format.json { render :show, status: :ok, location: @tipo_equipamento }
      else
        format.html { render :edit }
        format.json { render json: @tipo_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_equipamentos/1
  # DELETE /tipo_equipamentos/1.json
  def destroy
    if @tipo_equipamento.destroy
      respond_to do |format|
        format.html { redirect_to tipo_equipamentos_url, notice: @@msgs }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to tipo_equipamentos_url, notice: @@msge }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_equipamento
      @tipo_equipamento = TipoEquipamento.accessible_by(current_ability).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_equipamento_params
      params.require(:tipo_equipamento).permit(:tipo)
    end
end
