class Chamado < ActiveRecord::Base

	attr_accessor :problema_descricao

	belongs_to :problema
	belongs_to :user
	belongs_to :tecnico, class_name: "User"

	has_one :ordem

	validates_presence_of :problema_id, :user_id, :status, :data_status_aberto

	validates_presence_of :data_status_em_atendimento, :if => :verificar_status_em_atendimento
	validates_presence_of :tecnico_id, :if => :verificar_status_em_atendimento

	validates_presence_of :data_status_concluido, :if => :verificar_status_concluido

	validates_presence_of :data_status_fechado, :if => :verificar_status_fechado
	validates_presence_of :nivel_satisfacao_usuario, :if => :verificar_status_fechado
	validates_presence_of :avaliacao_usuario, :if => :verificar_status_fechado

	validates_presence_of :data_status_cancelado, :if => :verificar_status_cancelado
	validates_presence_of :motivo_cancelamento, :if => :verificar_status_cancelado

	validates_presence_of :problema_descricao, :if => :checar_problema_id

	def verificar_status_em_atendimento
		if self.status == "EM ATENDIMENTO"
			return true
		end
	end

	def verificar_status_concluido
		if self.status == "CONCLUIDO"
			return true
		end
	end

	def verificar_status_fechado
		if self.status == "FECHADO"
			return true
		end
	end

	def verificar_status_cancelado
		if self.status == "CANCELADO"
			return true
		end
	end

	def status_atual
		return self.status.to_s
	end

	def checar_problema_id
    if self.problema_id.blank?
      return true
    else
      return false
    end
  end


	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.observacoes_usuario = ActiveSupport::Inflector.transliterate(self.observacoes_usuario).upcase if !self.observacoes_usuario.blank?
		self.parecer_preliminar_tecnico = ActiveSupport::Inflector.transliterate(self.parecer_preliminar_tecnico).upcase if !self.parecer_preliminar_tecnico.blank?
		self.parecer_final_tecnico = ActiveSupport::Inflector.transliterate(self.parecer_final_tecnico).upcase if !self.parecer_final_tecnico.blank?

	end

	scope :este_mes, ->{ where("data_status_aberto >= ? and data_status_aberto <= ?", Date.today.beginning_of_month, Date.today.end_of_month) }

  scope :no_periodo, ->(ini,fim) { where("data_status_aberto >= ? and data_status_aberto <= ?", ini.to_date.beginning_of_month, fim.to_date.end_of_month) }

  # Chamado.where("data_status_aberto >= ? and data_status_aberto <= ? and tecnico_id = ?", "01/11/2016", "30/11/2016", "3")
  # cs.each do |c|
  # 	puts "Abertura = #{c.data_status_aberto} - Atendimento = #{c.data_status_em_atendimento} - #{c.tecnico.name} - #{c.user.name} - #{c.user.departamento.sigla} - #{c.status}"
  # 	puts ""
  # 	puts "\n"
  # end

end
