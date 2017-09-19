class Motoristum < ActiveRecord::Base
	validates_presence_of :nome, :cnh, :status, :categoria, :validade, :contato
	validates_uniqueness_of :cnh
	validates :cnh, length: { is: 11 }

	scope :livre, -> {where("status = ?", "LIVRE")}
	scope :em_veiculo, -> {where("status = ?", "EM VEICULO")}

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.nome = ActiveSupport::Inflector.transliterate(self.nome).upcase if !self.nome.blank?
		
	end

end
