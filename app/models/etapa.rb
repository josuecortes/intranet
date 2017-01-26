class Etapa < ActiveRecord::Base

	belongs_to :projeto
	has_and_belongs_to_many :users

	validates_presence_of :nome, :data_inicio, :data_final, :projeto_id
	
end
