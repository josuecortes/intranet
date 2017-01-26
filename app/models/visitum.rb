class Visitum < ActiveRecord::Base

	attr_accessor :departamento_nome

	belongs_to :visitante
	belongs_to :departamento

	validates_presence_of :visitante_id, :departamento_id

	validates_presence_of :departamento_nome, :if => :checar_departamento_id

	def checar_departamento_id
    if self.departamento_id.blank?
      return true
    else
      return false
    end 
  end

  before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.observacoes = ActiveSupport::Inflector.transliterate(self.observacoes).upcase if !self.observacoes.blank?  
		
	end

	scope :em_visita, -> { where("status = ?","EM VISITA")}
end
