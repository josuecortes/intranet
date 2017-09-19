class Posto < ActiveRecord::Base

	scope :livre, -> {where("status = ?", "LIVRE")}
	scope :disponivel, -> {where("status = ?", "DISPONIVEL")}

end
