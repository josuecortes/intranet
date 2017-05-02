class Ordem < ActiveRecord::Base

  belongs_to :departamento, :class_name=>"Departamento"
	belongs_to :user, :class_name=>"User"
	belongs_to :cliente, :class_name=>"User"
  belongs_to :chamado, :class_name=>"Chamado"

	validates_presence_of :cliente_id, :user_id, :status, :data_status_aberto, :departamento_id, :tipo_equipamento,
                        :especificacoes, :condicoes, :problema

	validates_presence_of :data_status_em_atendimento, :if => :verificar_status_em_atendimento

	validates_presence_of :data_status_concluido, :if => :verificar_status_concluido

  validates_presence_of :data_status_aguardando, :if => :verificar_status_aguardando

	validates_presence_of :data_status_fechado, :if => :verificar_status_fechado

  after_validation :atualizar_historico

  def atualizar_historico
    if self.status == "AGUARDANDO" or self.status == "CONCLUIDO" or self.status == "FECHADO"
      atual = self.historico
      self.historico = "#{atual} \n #{self.cabecalho} \n #{self.conversa} \n"
    end
  end

	def verificar_status_em_atendimento
		if self.status == "EM ATENDIMENTO"
			return true
		end
	end

  def verificar_status_aguardando
		if self.status == "AGUARDANDO"
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

	def status_atual
		return self.status.to_s
	end

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		#self.observacoes_usuario = ActiveSupport::Inflector.transliterate(self.observacoes_usuario).upcase if !self.observacoes_usuario.blank?
		#self.parecer_preliminar_tecnico = ActiveSupport::Inflector.transliterate(self.parecer_preliminar_tecnico).upcase if !self.parecer_preliminar_tecnico.blank?
		#self.parecer_final_tecnico = ActiveSupport::Inflector.transliterate(self.parecer_final_tecnico).upcase if !self.parecer_final_tecnico.blank?

	end

	#scope :este_mes, ->{ where("data_status_aberto >= ? and data_status_aberto <= ?", Date.today.beginning_of_month, Date.today.end_of_month) }

  #scope :no_periodo, ->(ini,fim) { where("data_status_aberto >= ? and data_status_aberto <= ?", ini, fim) }

end
