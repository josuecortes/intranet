class Veiculo < ActiveRecord::Base
	validates_presence_of :tipo, :marca, :modelo, :ano, :cor, :placa, :combustivel, :validade_documento, :capacidade, :status
	validates_uniqueness_of :placa
	validates :placa, length: { is: 8 }
	validates :ano, length: { is: 4 }

	belongs_to :posto
	belongs_to :motorista, :class_name => "Motoristum"

	scope :no_patio, -> {where("status != ?", "FORA")}

	scope :fora, -> {where(:status => "FORA")}

	scope :disponivel, -> {where(:status => "DISPONIVEL")}

	def entrar_no_patio(v,m,p)
		veiculo = self.find(v.id)
		motorista = Motoristum.find(m.id)
		posto = Posto.find(p.id)

		veiculo.motorista = motorista
		veiculo.posto = posto
		veiculo.status = "DISPONIVEL"

		motorista.status = "EM VEICULO"

		posto.status = "DISPONIVEL"

		if posto.save and veiculo.save and motorista.save
			return true
		else
			return false
		end

	end

	
	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.marca = ActiveSupport::Inflector.transliterate(self.marca).upcase if !self.marca.blank?
		self.modelo = ActiveSupport::Inflector.transliterate(self.modelo).upcase if !self.modelo.blank?
		self.cor = ActiveSupport::Inflector.transliterate(self.cor).upcase if !self.cor.blank?
		self.placa = ActiveSupport::Inflector.transliterate(self.placa).upcase if !self.placa.blank?
		
	end

end
