class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :colecoes

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
    #@passenger = @request.passengers.build
    #@destiny = @request.destinys.build

  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        flash[:success] = @@msgs
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        flash[:danger] = @@msge
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        flash[:success] = @@msgs
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        flash[:danger] = @@msge
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    if @request.destroy
      flash[:success] = @@msgs
    else
      flash[:danger] = @@msge
    end
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def autocomplete_passenger_nome
    term = params[:term]
    passageiros = Passenger.where('nome ilike ?',"%#{term}%").order(:nome).all
    render :json => passageiros.map { |passageiro| {:id => passageiro.id,:label => passageiro.nome, :value => passageiro.nome} }
  end

  def passengers
    @request = Request.find(params[:request_id])
    #@passengers = @request.passengers
    @request_passenger = @request.request_passengers.new
  end

  def passenger_add
    @request = Request.find(params[:request_id])
    @request_passenger = @request.request_passengers.new(params[:request_passenger_params])

    #@request_passenger = @request.request_passengers.new(request_passengers_params)

    puts "passenger_id"
    puts @request_passenger.passenger_id
    puts "end"

    #@passenger.passenger_id = params[:passenger_id]
    #@passenger.request_id = params[:request_id]

    respond_to do |format|
      if @request_passenger.save
        flash[:success] = @@msgs
        format.html { redirect_to request_passengers_url(@request), notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        flash[:danger] = @@msge
        format.html { render :passengers }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end

  end

  def requisitar
    @request = Request.find(params[:request_id])
    
    @flag = true

    @danger = ""
    @info = ""
    @success = ""

    if @request.data_hora_partida < Time.now
      @danger = @danger + "A data de partida é menor que a data atual. <br>"
      @flag = false
    end
    
    if (@request.data_hora_partida >= Time.now) and (@request.data_hora_partida <= (Time.now + 1.hour))
      @danger = @danger + "Você não pode requisitar pra menos de 1 hora <br>"
      @flag = false
    end

    if @request.tipo == "VIAGEM"
      if @request.data_hora_partida > @request.data_hora_volta
        @danger = @danger + "A data de volta é menor que a data de partida. <br>"
        @flag = false
      end
    end

    if ((@request.data_hora_partida >= (Time.now + 1.hour)) and (@request.data_hora_partida <= (Time.now + 6.days)))

      if @request.urgente == false
        @danger = @danger + "Esta requisição esta fora do prazo de 6 dias. Preencha o campo REQUISIÇÃO URGENTE no Formulario. <br>"
        @flag = false        
      else
        @info = @info + "Esta requisição é URGENTE e está fora do prazo de 6 dias, será submetida a avaliação pela CAD... <br>"
        @request.status = "AGUARDANDO LIBERACAO PELA CAD"
        @request.data_aguardando_cad = Time.now
      end

    end

    if (@request.data_hora_partida <= (Time.now + 6.days))
      @request.status = "AGUARDANDO LIBERACAO PELA USEGET"
      @request.data_aguardando_useget = Time.now
    end

    if @request.passengers.count == 0
      if @request.documento == false
        @danger = @danger + "Esta requisição não tem PASSAGEIROS. Caso seja APENAS ENTREGA DE DOCUMENTO, marque esta opção no Formulario. <br>"
        @flag = false
      else
        @info = @info + "Requisição sem PASSAGEIROS. APENAS ENTREGA DE DOCUMENTO"
      end        
    end

    if @request.destinies.count == 0
      @danger = @danger + "Esta requisição não tem DESTINO. <br>"
      @flag = false
    end

    if @flag == false

      if @danger != ""
        flash[:danger] = "<center> <h4> A REQUISIÇÃO NÃO FOI FINALIZADA </h4> </center> <br> CORRIJA OS ERROS ABAIXO <br> " + @danger
      end
      if @info != ""
        flash[:info] = "OBS: <br>" + @info
      end
      if @success != ""
        flash[:success] = @success
      end

    else  

      if @request.save

        @success = @success + "Requisição Enviada com Sucesso"
        if @info != ""
          flash[:info] = "OBS: <br> " + @info
        end
        if @success != ""
          flash[:success] = @success
        end

      else

        flash[:danger] = "A requisição esta correta. Mas algo estranho aconteceu"

      end

    end

    redirect_to requests_url

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:carga, :documento, :urgente, :motivo, :tipo, :portaria, :data_partida, :data_volta, :hora_partida, 
                                      :hora_volta, :status, :user_id,
                                      :data_aguardando_cad, :user_aguardando_cad_id,
                                      :data_aguardando_useget, :user_aguardando_useget_id,
                                      :data_aprovada, :user_data_aprovada_id,
                                      :data_em_andamento, :user_data_em_andamento_id,
                                      :data_finalizada, :user_data_finalizada_id,
                                      :data_cancelada, :user_data_cancelada_id,
                                      :motivo_cancelamento,
                                      request_passengers_attributes: [:id, :passenger_id, :request_id, :passenger_nome])
      
    end

    def colecoes
      @lista_tipo_requests = ['DESLOCAMENTO URBANO', 'VIAGEM']
      @lista_booleans = [['NAO',false],['SIM',true]]
    end
end
