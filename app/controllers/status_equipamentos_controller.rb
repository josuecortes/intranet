class StatusEquipamentosController < ApplicationController
  before_action :set_status_equipamento, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :class=>"StatusEquipamento", except: :create

  # GET /status_equipamentos
  # GET /status_equipamentos.json
  def index
    #@status_equipamentos = StatusEquipamento.all
    #@q = StatusEquipamento.ransack(params[:q])
    @status_equipamentos = StatusEquipamento.accessible_by(current_ability).order('status ASC')
  end

  # GET /status_equipamentos/1
  # GET /status_equipamentos/1.json
  def show
  end

  # GET /status_equipamentos/new
  def new
    @status_equipamento = StatusEquipamento.new
  end

  # GET /status_equipamentos/1/edit
  def edit
  end

  # POST /status_equipamentos
  # POST /status_equipamentos.json
  def create
    @status_equipamento = StatusEquipamento.new(status_equipamento_params)

    respond_to do |format|
      if @status_equipamento.save
        format.html { redirect_to @status_equipamento, notice: @@msgs }
        format.json { render :show, status: :created, location: @status_equipamento }
      else
        format.html { render :new }
        format.json { render json: @status_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_equipamentos/1
  # PATCH/PUT /status_equipamentos/1.json
  def update
    respond_to do |format|
      if @status_equipamento.update(status_equipamento_params)
        format.html { redirect_to @status_equipamento, notice: @@msgs }
        format.json { render :show, status: :ok, location: @status_equipamento }
      else
        format.html { render :edit }
        format.json { render json: @status_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_equipamentos/1
  # DELETE /status_equipamentos/1.json
  def destroy
    if @status_equipamento.destroy
      respond_to do |format|
        format.html { redirect_to status_equipamentos_url, notice: @@msgs }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to status_equipamentos_url, notice: @@msge }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_equipamento
      @status_equipamento = StatusEquipamento.accessible_by(current_ability).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_equipamento_params
      params.require(:status_equipamento).permit(:status)
    end
end
