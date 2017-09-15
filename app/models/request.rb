class Request < ActiveRecord::Base

	#self.table_name = "requests"

	attr_accessor :passenger_nome
	attr_accessor :destiny_nome

	#attr_accessor :hp, :mp, :hv, :mv

	has_many :request_passengers, dependent: :restrict_with_error
	has_many :passengers, through: :request_passengers
	
	#accepts_nested_attributes_for :request_passengers, allow_destroy: true
	#accepts_nested_attributes_for :passengers, allow_destroy: true


	
	has_many :request_destinies, dependent: :restrict_with_error
	has_many :destinies, through: :request_destinies
	#accepts_nested_attributes_for :request_destinies, allow_destroy: true
	#accepts_nested_attributes_for :destinies, allow_destroy: true

	belongs_to :user

	belongs_to :user_aguardando_cad, class_name: "User"
  belongs_to :user_aguardando_useget, class_name: "User"
  belongs_to :user_aprovada, class_name: "User"
  belongs_to :user_em_andamento, class_name: "User"
  belongs_to :user_finalizada, class_name: "User"
  belongs_to :user_cancelada, class_name: "User"


	#validates_presence_of :passenger_ids, :destiny_ids

	validates_presence_of :data_partida, :hora_partida, :tipo, :user_id, :status, :hora_volta

	validates_presence_of :portaria, :data_volta, :if => :checar_tipo_viagem

	validates_presence_of :motivo, :if => :checar_urgencia

	validates_presence_of :motivo_cancelamento, :data_cancelada, :user_cancelada_id, :if => :checar_cancelamento

	def checar_tipo_viagem
		if self.tipo == "VIAGEM"
			return true
		else
			return false
		end
	end

	def checar_urgencia
		if self.urgente == true
			return true
		else
			return false
		end
	end

	def checar_cancelamento
		if self.status == "CANCELADA"
			return true
		else
			return false
		end
	end

	after_validation :checar_campos

	def checar_campos
		if self.tipo == "DESLOCAMENTO URBANO"
			
			self.data_volta = nil
			#self.hora_volta = nil
			self.data_hora_volta = nil

			if !self.data_partida.blank? and !self.hora_partida.blank?
				@data_partida = self.data_partida.strftime("%d/%m/%Y")
				@hora_partida = self.hora_partida
				@partida = "#{@data_partida} #{@hora_partida}"
				self.data_hora_partida = (@partida.to_time).to_time
    	end
    else 
			
			if !self.data_partida.blank? and !self.hora_partida.blank?
    		@data_partida = self.data_partida.strftime("%d/%m/%Y")
				@hora_partida = self.hora_partida
				@partida = "#{@data_partida} #{@hora_partida}"
				self.data_hora_partida = (@partida.to_time).to_time
		  end
		  	
		  if !self.data_volta.blank? and !self.hora_volta.blank?	
				@data_volta = self.data_volta.strftime("%d/%m/%Y")
				@hora_volta = self.hora_volta
				@volta = "#{@data_volta} #{@hora_volta}"
				self.data_hora_volta = (@volta.to_time).to_time

			end

		end	
	end

	def cancelar_requisicao

		adm = User.where(:name => "ADMINISTRADOR DO SISTEMA").first


		self.status = "CANCELADA"
		self.motivo_cancelamento = "REQUISICAO CANCELADA AUTOMATICAMENTE PELO SISTEMA, MOTIVO: PASSOU 20 MINUTOS DA DATA E HORA DE SAIDA"
		self.data_cancelada = Time.now
		self.user_cancelada = adm

		if self.save
			return true
		else
			return false
		end

	end

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.motivo = ActiveSupport::Inflector.transliterate(self.motivo).upcase if !self.motivo.blank?

	end

		
end
