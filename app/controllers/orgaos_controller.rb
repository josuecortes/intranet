class OrgaosController < ApplicationController
  before_action :set_orgao, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :class=>"Orgao", except: :create

  # GET /orgaos
  # GET /orgaos.json
  def index
    #@orgaos = Orgao.all
    @orgaos = Orgao.accessible_by(current_ability).order('nome ASC')
  end

  # GET /orgaos/1
  # GET /orgaos/1.json
  def show
  end

  # GET /orgaos/new
  def new
    @orgao = Orgao.new
  end

  # GET /orgaos/1/edit
  def edit
  end

  # POST /orgaos
  # POST /orgaos.json
  def create
    @orgao = Orgao.new(orgao_params)

    respond_to do |format|
      if @orgao.save
        format.html { redirect_to @orgao, notice: @@msgs }
        format.json { render :show, status: :created, location: @orgao }
      else
        format.html { render :new }
        format.json { render json: @orgao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orgaos/1
  # PATCH/PUT /orgaos/1.json
  def update
    respond_to do |format|
      if @orgao.update(orgao_params)
        format.html { redirect_to @orgao, notice: @@msgs }
        format.json { render :show, status: :ok, location: @orgao }
      else
        format.html { render :edit }
        format.json { render json: @orgao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orgaos/1
  # DELETE /orgaos/1.json
  def destroy
    if @orgao.destroy
      respond_to do |format|
        format.html { redirect_to orgaos_url, notice: @@msgs }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to orgaos_url, notice: @@msge }
        format.json { head :no_content }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orgao
      @orgao = Orgao.accessible_by(current_ability).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orgao_params
      params.require(:orgao).permit(:nome)
    end
end
