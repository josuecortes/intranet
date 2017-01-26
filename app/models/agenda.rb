class Agenda < ActiveRecord::Base

	belongs_to :user

	validates_presence_of :tipo, :titulo, :informacoes, :data_hora, :user_id

	scope :publicado, -> { where("publicado = ?",true)}


end
