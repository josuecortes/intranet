class RequestDestiny < ActiveRecord::Base
	belongs_to :request
	belongs_to :destiny

	attr_accessor :destiny_nome

	validates_presence_of :request_id, :destiny_id
	validates_uniqueness_of :destiny_id, :scope => :request_id

	validates_presence_of :endereco, :if => :checar_tipo_requisicao

	def checar_tipo_requisicao
		if self.request.tipo == "VIAGEM"
			return true
		else
			return false
		end
	end
end