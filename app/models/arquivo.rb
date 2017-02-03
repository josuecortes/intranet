class Arquivo < ActiveRecord::Base

	belongs_to :informativo

	#has_attached_file :avatar
  #validates_attachment :avatar, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
  	mount_uploader :avatar, ImageUploader

  	validates_presence_of :informativo_id, :nome, :avatar
end
