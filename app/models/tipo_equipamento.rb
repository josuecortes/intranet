class TipoEquipamento < ActiveRecord::Base

	has_many :detalhes_equipamentos, dependent: :restrict_with_error
	has_many :equipamentos, :through => :detalhes_equipamentos

	validates_presence_of :tipo
	validates_uniqueness_of :tipo

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.tipo = ActiveSupport::Inflector.transliterate(self.tipo).upcase if !self.tipo.blank?  
		
	end
end