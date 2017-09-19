class PostosController < ApplicationController
  before_action :set_posto, only: [:show, :edit, :update, :destroy]

  # GET /postos
  # GET /postos.json
  def index
    @postos = Posto.all
  end

  # GET /postos/1
  # GET /postos/1.json
  def show
  end

  # GET /postos/new
  def new
    @posto = Posto.new
  end

  # GET /postos/1/edit
  def edit
  end

  # POST /postos
  # POST /postos.json
  def create
    @posto = Posto.new(posto_params)

    respond_to do |format|
      if @posto.save
        format.html { redirect_to @posto, notice: 'Posto was successfully created.' }
        format.json { render :show, status: :created, location: @posto }
      else
        format.html { render :new }
        format.json { render json: @posto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postos/1
  # PATCH/PUT /postos/1.json
  def update
    respond_to do |format|
      if @posto.update(posto_params)
        format.html { redirect_to @posto, notice: 'Posto was successfully updated.' }
        format.json { render :show, status: :ok, location: @posto }
      else
        format.html { render :edit }
        format.json { render json: @posto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postos/1
  # DELETE /postos/1.json
  def destroy
    @posto.destroy
    respond_to do |format|
      format.html { redirect_to postos_url, notice: 'Posto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def criar_postos
    if Posto.last.codigo == "#{DateTime.now.year}#{DateTime.now.month}10"
      flash[:info] = "Ateção: Os postos desse mês já foram criados!"
    else
      Posto.find_or_create_by(:codigo=>"#{DateTime.now.year}#{DateTime.now.month}0", :tipo=>"KILOMETRAGEM", :kms_total => 10000, :kms_usado => 0, :status=>"LIVRE")
      Posto.find_or_create_by(:codigo=>"#{DateTime.now.year}#{DateTime.now.month}1", :tipo=>"KILOMETRAGEM", :kms_total => 10000, :kms_usado => 0, :status=>"LIVRE")
      Posto.find_or_create_by(:codigo=>"#{DateTime.now.year}#{DateTime.now.month}2", :tipo=>"KILOMETRAGEM", :kms_total => 10000, :kms_usado => 0, :status=>"LIVRE")
      Posto.find_or_create_by(:codigo=>"#{DateTime.now.year}#{DateTime.now.month}3", :tipo=>"KILOMETRAGEM", :kms_total => 10000, :kms_usado => 0, :status=>"LIVRE")
      Posto.find_or_create_by(:codigo=>"#{DateTime.now.year}#{DateTime.now.month}4", :tipo=>"KILOMETRAGEM", :kms_total => 10000, :kms_usado => 0, :status=>"LIVRE")
      Posto.find_or_create_by(:codigo=>"#{DateTime.now.year}#{DateTime.now.month}5", :tipo=>"KILOMETRAGEM", :kms_total => 10000, :kms_usado => 0, :status=>"LIVRE")
      Posto.find_or_create_by(:codigo=>"#{DateTime.now.year}#{DateTime.now.month}6", :tipo=>"KILOMETRAGEM", :kms_total => 10000, :kms_usado => 0, :status=>"LIVRE")
      Posto.find_or_create_by(:codigo=>"#{DateTime.now.year}#{DateTime.now.month}7", :tipo=>"KILOMETRAGEM", :kms_total => 10000, :kms_usado => 0, :status=>"LIVRE")
      Posto.find_or_create_by(:codigo=>"#{DateTime.now.year}#{DateTime.now.month}8", :tipo=>"KILOMETRAGEM", :kms_total => 10000, :kms_usado => 0, :status=>"LIVRE")
      Posto.find_or_create_by(:codigo=>"#{DateTime.now.year}#{DateTime.now.month}9", :tipo=>"KILOMETRAGEM", :kms_total => 10000, :kms_usado => 0, :status=>"LIVRE")
      Posto.find_or_create_by(:codigo=>"#{DateTime.now.year}#{DateTime.now.month}10", :tipo=>"KILOMETRAGEM", :kms_total => 10000, :kms_usado => 0, :status=>"LIVRE")

      flash[:info] = "Foram criados 10 postos de serviço"
      
    end

    redirect_to postos_url
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posto
      @posto = Posto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def posto_params
      params.require(:posto).permit(:codigo, :tipo, :kms_total, :kms_usado, :status)
    end
end
