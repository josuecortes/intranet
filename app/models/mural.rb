class Mural < ActiveRecord::Base

	belongs_to :user

	validates_presence_of :texto, :user_id
	
end
