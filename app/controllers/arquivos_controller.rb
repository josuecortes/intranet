class ArquivosController < ApplicationController
  before_action :set_arquivo, only: [:show, :edit, :update, :destroy]

  # GET /arquivos
  # GET /arquivos.json
  def index
    @informativo = Informativo.find(params[:informativo_id])
    @arquivos = @informativo.arquivos
  end

  # GET /arquivos/1
  # GET /arquivos/1.json
  def show
  end

  # GET /arquivos/new
  def new
    @informativo = Informativo.find(params[:informativo_id])
    @arquivo = @informativo.arquivos.build
  end

  # GET /arquivos/1/edit
  def edit
  end

  # POST /arquivos
  # POST /arquivos.json
  def create

    @informativo = Informativo.find(params[:informativo_id])
    @arquivo = @informativo.arquivos.build(arquivo_params)

    respond_to do |format|
      if @arquivo.save
        format.html { redirect_to informativo_arquivos_url(@informativo), notice: @@msgs }
        format.json { render :show, status: :created, location: @arquivo }
      else
        format.html { render :new }
        format.json { render json: @arquivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arquivos/1
  # PATCH/PUT /arquivos/1.json
  def update
    respond_to do |format|
      if @arquivo.update(arquivo_params)
        format.html { redirect_to informativo_arquivos_url(@informativo), notice: @@msgs }
        format.json { render :show, status: :ok, location: @arquivo }
      else
        format.html { render :edit }
        format.json { render json: @arquivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arquivos/1
  # DELETE /arquivos/1.json
  def destroy
    if @arquivo.destroy
      respond_to do |format|
        format.html { redirect_to informativo_arquivos_url(@informativo), notice: @@msgs }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to informativo_arquivos_url(@informativo), notice: @@msge }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arquivo
      @informativo = Informativo.find(params[:informativo_id])
      @arquivo = @informativo.arquivos.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arquivo_params
      params.require(:arquivo).permit(:nome, :informativo_id, :avatar)
    end
end
