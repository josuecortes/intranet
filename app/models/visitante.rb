class Visitante < ActiveRecord::Base
	
	has_many :visitas, :class_name=>"Visitum", dependent: :restrict_with_error

	validates_presence_of :nome
	validates_presence_of :rg, :if => :verificar_cpf
	validates_presence_of :cpf, :if => :verificar_rg

	def verificar_cpf
		if self.cpf.blank?
			return true
		end
	end

	def verificar_rg
		if self.rg.blank?
			return true
		end
	end

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.nome = ActiveSupport::Inflector.transliterate(self.nome).upcase if !self.nome.blank?  

	end

	def pode_dar_entrada
		cont = 0
		self.visitas.each do |v|
			if v.status != "CONCLUIDA"
				cont = cont + 1
			end
		end
		if cont == 0
			return true
		else
			return false
		end
	end


end
