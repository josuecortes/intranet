class Informativo < ActiveRecord::Base

	belongs_to :user
	has_many :arquivos

	mount_uploader :avatar, ImageUploader

	validates_presence_of :tipo, :titulo, :informacoes, :user_id
	validates_presence_of :avatar, :if => :checar_tipo

	scope :publicado, -> { where("publicado = ?",true)}

	def checar_tipo
    if self.tipo != "NOTÍCIA RAPIDA"
      return true
    else
      return false
    end
  end

end
