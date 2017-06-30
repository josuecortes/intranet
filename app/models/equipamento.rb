class Equipamento < ActiveRecord::Base

	belongs_to :departamento
	belongs_to :departamento_emprestimo, inverse_of: :equipamentos_emprestados, :class_name=>"Departamento"
	belongs_to :detalhes_equipamento
	belongs_to :status_equipamento
  belongs_to :escola
  belongs_to :orgao

	attr_accessor :departamento_nome, :departamento_emprestimo_nome, :detalhes_equipamento_nome, :orgao_nome, :escola_nome

	validates_presence_of :status_equipamento_id, :departamento_id, :detalhes_equipamento_id, :situacao
  
	validates_presence_of :departamento_nome, :if => :checar_departamento_id
	validates_presence_of :data_patrimonio, :if => :checar_situacao_patrimonio
  validates_presence_of :doador, :if => :checar_situacao_doacao
  validates_presence_of :proprietario, :if => :checar_situacao_particular

  validates_presence_of :departamento_emprestimo_id, :if => :checar_cessao_departamento_emprestimo_id

	# validates_presence_of :responsavel, :if => :checar_situacao_emprestimo

	# validates_presence_of :departamento_emprestimo_id, :if => :checar_situacao_emprestimo

 #  validates_presence_of :detalhes_equipamento_nome, :if => :checar_detalhes_equipamento_id
	
 #  validates_presence_of :departamento_nome, :if => :checar_departamento_id

 #  validates_presence_of :departamento_emprestimo_nome, :if => :checar_departamento_emprestimo_id_and_situacao

 #  validates_presence_of :escola_nome, :if => :checar_departamento_emprestimo_id_and_situacao

 #  validates_presence_of :orgao_nome, :if => :checar_departamento_emprestimo_id_and_situacao

	# validates_uniqueness_of :patrimonio, :if => :checar_patrimonio

	before_save :maiusculas_sem_acentos
  before_save :checar_coisas

	def maiusculas_sem_acentos

		#self.responsavel = ActiveSupport::Inflector.transliterate(self.responsavel).upcase if !self.responsavel.blank?  
		
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
    if self.situacao == "CESSAO" and self.departamento_emprestimo_id.blank? and self.escola_id.blank? and self.orgao_id.blank?
      return true
    else
      return false
    end 
  end

  def checar_situacao_compra
    if self.situacao == "COMPRA"
      return true
    else
      return false
    end 
  end

  def checar_situacao_particular
    if self.situacao == "PARTICULAR"
      return true
    else
      return false
    end 
  end

  def checar_situacao_doacao
    if self.situacao == "DOACAO"
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
    if self.situacao == "CESSAO"
      return true
    else
      return false
    end 
  end

  def checar_cessao_departamento_emprestimo_id
    if self.situacao == "CESSAO"
      if self.escola_id == nil and self.orgao_id == nil
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def checar_cessao_escola_id
    if self.situacao == "CESSAO"
      if self.departamento_emprestimo_id == nil and self.orgao_id == nil
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def checar_cessao_orgao_id
    if self.situacao == "CESSAO"
      if self.departamento_emprestimo_id == nil and self.escola_id == nil
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def checar_coisas
    if self.situacao == "COMPRA"
      self.data_patrimonio = nil
      self.departamento_emprestimo_id = nil
      self.escola_id = nil
      self.orgao_id = nil
      self.doador = nil
      self.proprietario = nil
      #self.responsavel = nil
    end

    if self.situacao == "CESSAO"
      self.data_patrimonio = nil
      self.doador = nil
      self.proprietario = nil
      self.data_patrimonio = nil

      if self.departamento_emprestimo_id != nil
        self.escola_id = nil
        self.orgao_id = nil
      elsif self.escola_id != nil
        self.departamento_emprestimo_id = nil
        self.orgao_id = nil
      elsif orgao_id != nil
        self.departamento_emprestimo_id = nil
        self.escola_id = nil
      end

    end

    if self.situacao == "PATRIMONIO"
      #self.data_patrimonio = nil
      self.departamento_emprestimo_id = nil
      self.escola_id = nil
      self.orgao_id = nil
      self.doador = nil
      self.proprietario = nil
      #self.responsavel = nil
    end

    if self.situacao == "PARTICULAR"
      self.data_patrimonio = nil
      self.departamento_emprestimo_id = nil
      self.escola_id = nil
      self.orgao_id = nil
      self.doador = nil
      #self.proprietario = nil
      #self.responsavel = nil
    end

    if self.situacao == "DOACAO"
      self.data_patrimonio = nil
      self.departamento_emprestimo_id = nil
      self.escola_id = nil
      self.orgao_id = nil
      #self.doador = nil
      self.proprietario = nil
      #self.responsavel = nil
    end
  end

end
