class Informativo < ActiveRecord::Base

	belongs_to :user
	has_many :arquivos

	validates_presence_of :tipo, :titulo, :informacoes, :user_id

	scope :publicado, -> { where("publicado = ?",true)}
end
