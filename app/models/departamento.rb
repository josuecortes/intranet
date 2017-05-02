class Departamento < ActiveRecord::Base

	has_many :users, dependent: :restrict_with_error
	has_many :equipamentos, dependent: :restrict_with_error
	has_many :equipamentos_emprestados, inverse_of: :departamento_emprestimo, :class_name=>"Equipamento", dependent: :restrict_with_error

	has_many :chamados, through: :users
	has_many :projetos
	has_many :ordems

	has_many :visitas, :class_name=>"Visitum", dependent: :restrict_with_error

	validates_presence_of :nome, :sigla
	validates_uniqueness_of :nome, :sigla

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.nome = ActiveSupport::Inflector.transliterate(self.nome).upcase if !self.nome.blank?
		self.sigla = ActiveSupport::Inflector.transliterate(self.sigla).upcase if !self.sigla.blank?

	end
end
