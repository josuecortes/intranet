class Projeto < ActiveRecord::Base

	belongs_to :user

	belongs_to :departamento

	has_many :etapas, dependent: :restrict_with_error

	has_and_belongs_to_many :users

	validates_presence_of :nome, :resumo, :status, :user_id, :local, :metodo, :departamento_id, :data_inicial, 
	:data_final

	scope :publicado, -> { where("publicado = ?",true)}

end
