class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :departamento_nome

  attr_accessor :mes

  mount_uploader :avatar, ImageUploader

  #attr_accessor :avatar

  belongs_to :departamento
  has_many :chamados, dependent: :restrict_with_error
  has_many :atendimentos, class_name: "Chamado", foreign_key: "tecnico_id", dependent: :restrict_with_error

  has_many :ordems, dependent: :restrict_with_error
  has_many :ordem_servicos, class_name: "Ordem", foreign_key: "cliente_id", dependent: :restrict_with_error

  has_many :agendas, dependent: :restrict_with_error
  has_many :informativos, dependent: :restrict_with_error
  has_many :projetos, dependent: :restrict_with_error

  has_and_belongs_to_many :roles
  has_and_belongs_to_many :etapas
  has_and_belongs_to_many :projetos

  ############# TRANSPORTE #########################


  has_many :requests
  has_many :requests_cads, class_name: "Request", foreign_key: "user_aguardando_cad_id", dependent: :restrict_with_error
  has_many :requests_usegets, class_name: "Request", foreign_key: "user_aguardando_useget_id", dependent: :restrict_with_error
  has_many :requests_aprovadas, class_name: "Request", foreign_key: "user_aprovada_id", dependent: :restrict_with_error
  has_many :requests_em_andamentos, class_name: "Request", foreign_key: "user_em_andamento_id", dependent: :restrict_with_error
  has_many :requests_finalizadas, class_name: "Request", foreign_key: "user_finalizada_id", dependent: :restrict_with_error
  has_many :requests_canceladas, class_name: "Request", foreign_key: "user_cancelada_id", dependent: :restrict_with_error

  

  #has_attached_file :avatar,
  #styles: {
  #  original: "800>600>", medium: "300x300>", thumb: "100x100#", info: "80x80#", chat: "128x128#" },
  #  default_url: lambda { |image| ActionController::Base.helpers.asset_path('user-default.jpg') }

  #validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  #do_not_validate_attachment_file_type :avatar

  #validates_attachment_content_type :avatar, content_type: /\Aimage/
  #validates_attachment_file_name :avatar, matches: [/png\z/, /jpe?g\z/]
  #do_not_validate_attachment_file_type :avatar

  validates_presence_of :name, :cpf
	validates_uniqueness_of :name, :cpf
  validates_presence_of :departamento_id, :if => :nao_admin
  validates_presence_of :nascimento, :if => :nao_admin
  validates_presence_of :departamento_nome, :if => :checar_departamento_id


  def pode_criar_chamado
    if self.chamados.count > 0
      c = self.chamados.last
      if c.status == "FECHADO" or c.status == "CANCELADO"
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def e_tecnico
    r = Role.where(:nome=>"TECNICO").first
    if self.roles.include?r
      return true
    else
      return false
    end
  end

  def nao_admin
    r = Role.where(:nome=>"ADMINISTRADOR").first
    if self.roles.include?r
      return false
    else
      return true
    end
  end

  def nao_admin_nao_tecnico
    r1 = Role.where(:nome=>"ADMINISTRADOR").first
    r2 = Role.where(:nome=>"TECNICO").first
    if (self.roles.include?r1 or self.roles.include?r2)
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

  def e_editor
    r1 = Role.where(:nome=>"EDITOR").first

    if (self.roles.include?r1)
      return true
    else
      return false
    end
  end

  def e_portaria
    r1 = Role.where(:nome=>"PORTARIA").first

    if (self.roles.include?r1)
      return true
    else
      return false
    end
  end

  def cad_transporte?
    r1 = Role.where(:nome=>"CAD TRANSPORTE").first

    if (self.roles.include?r1)
      return true
    else
      return false
    end
  end

  def useget_transporte?
    r1 = Role.where(:nome=>"USEGET TRANSPORTE").first

    if (self.roles.include?r1)
      return true
    else
      return false
    end
  end

  def requisitante_transporte?
    r1 = Role.where(:nome=>"REQUISITANTE TRANSPORTE").first

    if (self.roles.include?r1)
      return true
    else
      return false
    end
  end

  def adicionar_participante_no_projeto(projeto)
    projeto.users << self
    if projeto.save
      return true
    else
      return false
    end
  end

  def remover_participante_do_projeto(projeto)
    projeto.users.delete(self)
    if projeto.save
      return true
    else
      return false
    end
  end


	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.name = ActiveSupport::Inflector.transliterate(self.name).upcase if !self.name.blank?

	end

  validate :is_valid_dob?

  private
  def is_valid_dob?
    if((nascimento.is_a?(Date) rescue ArgumentError) == ArgumentError)
      errors.add(:nascimento, 'Entre com uma data valida.')
    end
  end



end
