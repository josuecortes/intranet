class Informativo < ActiveRecord::Base

	belongs_to :user
	has_many :arquivos

	mount_uploader :avatar, ImageUploader

	validates_presence_of :tipo, :titulo, :informacoes, :user_id, :avatar

	scope :publicado, -> { where("publicado = ?",true)}
end
