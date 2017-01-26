class StatusEquipamento < ActiveRecord::Base

	has_many :equipamentos, dependent: :restrict_with_error

  validates_presence_of :status
	validates_uniqueness_of :status

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.status = ActiveSupport::Inflector.transliterate(self.status).upcase if !self.status.blank?

	end
end