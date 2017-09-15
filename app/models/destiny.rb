class Destiny < ActiveRecord::Base
	has_many :request_destinies
	has_many :requests, through: :request_destinies

	validates_presence_of :nome, :municipio, :bairro, :logradouro, :numero, :cep, :if => :checar_tipo
	validates_uniqueness_of :nome

	def checar_tipo
		if self.tipo == "DESLOCAMENTO URBANO"
			return true
		else
			return false
	  end
	end  

	after_validation :full_street_address
	
	def full_street_address
		if self.tipo == "DESLOCAMENTO URBANO" or self.tipo == "ESPECIAL"
			"#{self.numero}, #{self.logradouro}, #{self.municipio}, AP"
		else
			"MUNICIPIO #{self.municipio}, AP"
		end
	end

	geocoded_by :full_street_address   # can also be an IP address
	
	after_validation :geocode          # auto-fetch coordinates

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.nome = ActiveSupport::Inflector.transliterate(self.nome).upcase if !self.nome.blank?
		self.bairro = ActiveSupport::Inflector.transliterate(self.bairro).upcase if !self.bairro.blank?
		self.logradouro = ActiveSupport::Inflector.transliterate(self.logradouro).upcase if !self.logradouro.blank?
		self.numero = ActiveSupport::Inflector.transliterate(self.numero).upcase if !self.numero.blank?
		self.descricao = ActiveSupport::Inflector.transliterate(self.descricao).upcase if !self.descricao.blank?

	end
end
