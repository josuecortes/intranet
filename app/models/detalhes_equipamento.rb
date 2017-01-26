class DetalhesEquipamento < ActiveRecord::Base

	validates_presence_of :modelo, :tipo_equipamento_id
	validates_uniqueness_of :modelo

	belongs_to :tipo_equipamento

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.modelo = ActiveSupport::Inflector.transliterate(self.modelo).upcase if !self.modelo.blank?  
		self.configuracao = ActiveSupport::Inflector.transliterate(self.configuracao).upcase if !self.configuracao.blank? 
		
	end
end
