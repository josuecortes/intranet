class MuralsController < ApplicationController
  before_action :set_mural, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :class=>"Mural", except: :create

  # GET /murals
  # GET /murals.json
  def index
    #@murals = Mural.all
    @murals = Mural.accessible_by(current_ability).order('created_at DESC')
  end

  # GET /murals/1
  # GET /murals/1.json
  def show
  end

  # GET /murals/new
  def new
    @mural = Mural.new
  end

  # GET /murals/1/edit
  def edit
  end

  # POST /murals
  # POST /murals.json
  def create
    @mural = Mural.new(mural_params)

    respond_to do |format|
      if @mural.save
        flash[:success] = @@msgs
        format.html { redirect_to @mural, notice: @@msgs }
        format.json { render :show, status: :created, location: @mural }
      else
        flash[:danger] = @@msge
        format.html { render :new }
        format.json { render json: @mural.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /murals/1
  # PATCH/PUT /murals/1.json
  def update
    respond_to do |format|
      if @mural.update(mural_params)
        flash[:success] = @@msgs
        format.html { redirect_to @mural, notice: @@msgs }
        format.json { render :show, status: :ok, location: @mural }
      else
        flash[:danger] = @@msge
        format.html { render :edit }
        format.json { render json: @mural.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /murals/1
  # DELETE /murals/1.json
  def destroy
    if @mural.destroy
      flash[:success] = @@msgs
    else
      flash[:danger] = @@msge
    end
    respond_to do |format|
      format.html { redirect_to murals_url, notice: @@msgs }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mural
      @mural = Mural.accessible_by(current_ability).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mural_params
      params.require(:mural).permit(:texto, :user_id)
    end
end
