class Passenger < ActiveRecord::Base
	has_many :request_passengers, dependent: :restrict_with_error
	has_many :requests, through: :request_passengers

	validates_presence_of :nome, :cpf, :tipo
	validates_uniqueness_of :cpf
	validates_uniqueness_of :matricula, :if => :checar_matricula_em_branco
	validates_presence_of :respaldo, :if => :checar_matricula

	def checar_matricula_em_branco
	  if self.matricula.blank?
	  	return false
	  else
	  	return true
	  end
	end

	def checar_matricula
	  if self.matricula.blank?
	  	return true
	  else
	  	return false
	  end
	end

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.nome = ActiveSupport::Inflector.transliterate(self.nome).upcase if !self.nome.blank?
		self.respaldo = ActiveSupport::Inflector.transliterate(self.respaldo).upcase if !self.respaldo.blank?

	end



end
