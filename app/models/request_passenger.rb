class RequestPassenger < ActiveRecord::Base
	belongs_to :request
	belongs_to :passenger

	attr_accessor :passenger_nome

	validates_presence_of :request_id, :passenger_id
	validates_uniqueness_of :passenger_id, :scope => :request_id

end
