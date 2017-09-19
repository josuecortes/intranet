class PatioController < ApplicationController
  def index
  	@no_patio = Veiculo.no_patio
  	@veiculos = Veiculo.fora
  	@postos = Posto.livre
  	@motoristas = Motoristum.livre
  end

  def entrada
  	if !params[:carro].blank?
  		@veiculo = Veiculo.fora.find(params[:carro])
    end

    if !params[:motorista].blank?
  		@motorista = Motoristum.livre.find(params[:motorista])
    end

    if !params[:posto].blank?
  		@posto = Posto.livre.find(params[:posto])
    end

    if @veiculo != nil and @motorista != nil and @posto != nil
    	veiculo = Veiculo.find(@veiculo.id)
			motorista = Motoristum.find(@motorista.id)
			posto = Posto.find(@posto.id)

			veiculo.motorista_id = motorista.id
			veiculo.posto_id = posto.id
			veiculo.status = "DISPONIVEL"

			motorista.status = "EM VEICULO"

			posto.status = "DISPONIVEL"

			if posto.save and veiculo.save and motorista.save
				flash[:success] = "Entrou no Patio"
			else
				flash[:danger] = "Erro ao entrar no Patio"
			end
    else
    	flash[:danger] = "Erro no processamento."
    end

    redirect_to patio_index_url

  end

  def saida
  	@veiculo = Veiculo.find(params[:veiculo_id])

  	if @veiculo.status == "DISPONIVEL" and @veiculo.motorista.status == "EM VEICULO" and @veiculo.posto.status == "DISPONIVEL"
  		@veiculo.status = "FORA"
  		@motorista = Motoristum.find(@veiculo.motorista_id)
  		@motorista.status = "LIVRE"
  		@posto = Posto.find(@veiculo.posto_id)
  		@posto.status = "LIVRE"

  		@veiculo.motorista_id = nil
  		@veiculo.posto_id = nil

  		if @veiculo.save and @motorista.save and @posto.save
  			flash[:success] = "Saiu do Patio"
  		else
  			flash[:danger] = "Erro ao Sair do Patio"
  		end
    end
    
    redirect_to patio_index_url

  end
end
