class Equipamento < ActiveRecord::Base

	belongs_to :departamento
	belongs_to :departamento_emprestimo, inverse_of: :equipamentos_emprestados, :class_name=>"Departamento"
	belongs_to :detalhes_equipamento
	belongs_to :status_equipamento

	attr_accessor :departamento_nome, :departamento_emprestimo_nome, :detalhes_equipamento_nome

	validates_presence_of :status_equipamento_id, :departamento_id, :detalhes_equipamento_id, :situacao, :quantidade
  
	validates_presence_of :departamento_nome, :if => :checar_departamento_id
	validates_presence_of :data_patrimonio, :if => :checar_situacao_patrimonio
	validates_presence_of :responsavel, :if => :checar_situacao_emprestimo
	validates_presence_of :departamento_emprestimo_id, :if => :checar_situacao_emprestimo

  validates_presence_of :detalhes_equipamento_nome, :if => :checar_detalhes_equipamento_id
	
  validates_presence_of :departamento_nome, :if => :checar_departamento_id

  validates_presence_of :departamento_emprestimo_nome, :if => :checar_departamento_emprestimo_id_and_situacao

	validates_uniqueness_of :patrimonio, :if => :checar_patrimonio

	before_save :maiusculas_sem_acentos
  before_save :checar_coisas

	def maiusculas_sem_acentos

		self.responsavel = ActiveSupport::Inflector.transliterate(self.responsavel).upcase if !self.responsavel.blank?  
		
	end

  def checar_patrimonio
    if self.patrimonio.blank?
      return false
    else
      return true
    end
  end

  def checar_detalhes_equipamento_id
    if self.detalhes_equipamento_id.blank?
      return true
    else
      return false
    end 
  end

	def checar_departamento_id
    if self.departamento_id.blank?
      return true
    else
      return false
    end 
  end

  def checar_departamento_emprestimo_id_and_situacao
    if self.situacao == "EMPRESTIMO" and self.departamento_emprestimo_id.blank?
      return true
    else
      return false
    end 
  end


  def checar_situacao_patrimonio
    if self.situacao == "PATRIMONIO"
      return true
    else
      return false
    end 
  end

  def checar_situacao_emprestimo
    if self.situacao == "EMPRESTIMO"
      return true
    else
      return false
    end 
  end

  def checar_coisas
    if self.situacao == "NORMAL"
      self.data_patrimonio = nil
      self.departamento_emprestimo_id = nil
      self.responsavel = nil
    end

    if self.situacao == "EMPRESTIMO"
      self.data_patrimonio = nil
    end

    if self.situacao == "PATRIMONIO"
      self.departamento_emprestimo_id = nil
      self.responsavel = nil
    end
  end

end
