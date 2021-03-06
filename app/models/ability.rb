class Ability
  include CanCan::Ability

  ADMINISTRADOR = Role.where(:nome=>"ADMINISTRADOR").first
  TECNICO = Role.where(:nome=>"TECNICO").first
  REQUISITANTE = Role.where(:nome=>"REQUISITANTE").first
  ESTATISTICAS = Role.where(:nome=>"ESTATISTICAS").first
  EDITOR = Role.where(:nome=>"EDITOR").first
  PORTARIA = Role.where(:nome=>"PORTARIA").first

  REQUISITANTE_TRANSPORTE = Role.where(:nome=>"REQUISITANTE TRANSPORTE").first
  CAD_TRANSPORTE = Role.where(:nome=>"CAD TRANSPORTE").first
  USEGET_TRANSPORTE = Role.where(:nome=>"USEGET TRANSPORTE").first

  def initialize(user)

    if user.roles.include?ADMINISTRADOR
      can :manage, :all
      can :show, :estatisticas
      cannot [:create, :update], Chamado

    end

    if user.roles.include?TECNICO
    	can :manage, Role
      can :manage, Problema
      can :manage, User#, {:role_id.not_in=>Role.where(:nome.in=>["ADMINISTRADOR"]).collect{|r|r.id}}
      can :manage, Inventario
      can :manage, Departamento
      can :manage, Item
      can :manage, Incidente
      can :manage, TipoIncidente
      can :manage, Equipamento
      can :manage, TipoEquipamento
      can :manage, DetalhesEquipamento
      can :manage, StatusEquipamento

      can :manage, Escola
      can :manage, Orgao

      can :manage, Mural, :user_id => user.id

      can :show, :estatisticas

      can :show, :estatisticas_admins

      can :show, :estatisticas_equipamentos

      can :manage, Chamado#, Chamado.where(:user_id != user.id)
      #cannot :fechar_chamado, Chamado, Chamado.where(:user_id != user.id)
      cannot :delete, Chamado, :user_id != user.id

      can :manage, Ordem
      cannot :delete, Ordem, :user_id != user.id

    	#cannot :pegar_chamado, Chamado, Chamado.where(:status != "ABERTO")
      #can :pegar_chamado, Chamado, Chamado.where(:status=>"ABERTO")

      #cannot :concluir_chamado, Chamado, Chamado.where(:status != "EM ATENDIMENTO", :tecnico_id != user.id)
    	#can :concluir_chamado, Chamado, {:status=>"EM ATENDIMENTO", :tecnico_id=>user.id}
    end

    if user.roles.include?REQUISITANTE

      #can :manage, Chamado, {:user_id=>user.id}
      can :manage, Chamado, :user_id => user.id
      #cannot :pegar_chamado, Chamado
      #cannot :cancelar_chamado, {:status=>'ABERTO'}
      #cannot :cancelar_chamado, Chamado, status: ['ABERTO', 'CONCLUIDO']
      #cannot :concluir_chamado, Chamado
      #cannot :delete, Chamado

      can :update, User, User.where(:id=>user.id)

      can :read, Incidente

      can :manage, Mural, :user_id => user.id

      can :manage, Ordem, :cliente_id => user.id
      cannot :create, Ordem


      #cannot
    	#can :edit, Chamado.where(:user_id=>user.id, :status=>"ABERTO")
    	#can :fechar_chamado, Chamado.where(user_id=>user.id, :status=>'CONCLUIDO')
    	#can :cancelar_chamado, Chamado.where(user_id=>user.id, :status.in=>(['ABERTO','EM ATENDIMENTO']))
    end

    if user.roles.include?ESTATISTICAS
      can :show, :estatisticas
      can :manage, Mural, :user_id => user.id
      can :update, User, User.where(:id=>user.id)
    end

    if user.roles.include?EDITOR
      can :manage, Agenda, :user_id => user.id
      can :manage, Projeto, :user_id => user.id
      can :manage, Informativo, :user_id => user.id
      can :manage, Mural, :user_id => user.id
    end

    if user.roles.include?PORTARIA
      can :manage, Visitante
      can :manage, Visitum
    end

    ############################  TRANSPORTE #########################################################


    ############################  CAD ########################################    
    if user.roles.include?CAD_TRANSPORTE

      can :read, Request, { :user_id => user.id, :status => "EM ABERTO" }
      can :update, Request, { :user_id => user.id, :status => "EM ABERTO" }
      can :delete, Request, { :user_id => user.id, :status => "EM ABERTO" }

      can :read, Request, { :status => "AGUARDANDO LIBERACAO PELA CAD" }
      can :read, Request, { :status => "AGUARDANDO LIBERACAO PELA USEGET" }
      can :read, Request, { :status => "APROVADA" }
      can :read, Request, { :status => "EM ANDAMENTO" }
      can :read, Request, { :status => "FINALIZADA" }
      can :read, Request, { :status => "CANCELADA" }

      can :create, Request
      
      can :requisitar, Request, { :user_id => user.id, :status => "EM ABERTO" }
      can :cancelar, Request do |r|
        Time.now < r.data_hora_partida and
        r.status != 'EM ABERTO' and
        r.status != 'FINALIZADA' and
        r.status != 'CANCELADA'         
      end
      can :cad_aprovar, Request do |r|
        Time.now < r.data_hora_partida and
        r.status == 'AGUARDANDO LIBERACAO PELA CAD'
      end

      #can :read, Request, :status <> "EM ABERTO"
      can :manage, Passenger
      can :manage, Destiny, {:tipo => "DESLOCAMENTO URBANO"}
      can :read, Destiny, {:tipo => "ESPECIAL", :tipo => "VIAGEM"}

      can [:create,:read,:update], Motoristum
      can [:create,:read,:update], Veiculo
      can [:create,:read,:update], Posto

    end


    ############################  USEGET ########################################
    if user.roles.include?USEGET_TRANSPORTE
      
      can :read, Request, { :user_id => user.id, :status => "EM ABERTO" }
      can :update, Request, { :user_id => user.id, :status => "EM ABERTO" }
      can :delete, Request, { :user_id => user.id, :status => "EM ABERTO" }

      can :read, Request, { :status => "AGUARDANDO LIBERACAO PELA CAD" }
      can :read, Request, { :status => "AGUARDANDO LIBERACAO PELA USEGET" }
      can :read, Request, { :status => "APROVADA" }
      can :read, Request, { :status => "EM ANDAMENTO" }
      can :read, Request, { :status => "FINALIZADA" }
      can :read, Request, { :status => "CANCELADA" }

      can :create, Request
      can :requisitar, Request, { :user_id => user.id, :status => "EM ABERTO" }
      can :cancelar, Request do |r|
        Time.now < r.data_hora_partida and
        r.status != 'EM ABERTO' and
        r.status != 'FINALIZADA' and
        r.status != 'CANCELADA'         
      end
      can :useget_aprovar, Request do |r|
        Time.now < r.data_hora_partida and
        r.status == 'AGUARDANDO LIBERACAO PELA USEGET'
      end

      can :manage, Passenger
      can :manage, Destiny, {:tipo => "DESLOCAMENTO URBANO"}
      can :read, Destiny, {:tipo => "ESPECIAL", :tipo => "VIAGEM"}

      can [:create,:read,:update], Motoristum
      can [:create,:read,:update], Veiculo
      can :read, Posto


    end


    ############################  REQUISITANTE ########################################
    if user.roles.include?REQUISITANTE_TRANSPORTE

      #can :read, Request, { :user_id => user.id, :status => "EM ABERTO" }
      can :update, Request, { :user_id => user.id, :status => "EM ABERTO" }
      can :delete, Request, { :user_id => user.id, :status => "EM ABERTO" }
      can :create, Request
      can :requisitar, Request, { :user_id => user.id, :status => "EM ABERTO" }
      can :read, Request, { :user_id => user.id  }
      #can :cancelar, Request.where("user_id = ? and data_hora_partida < ?", user.id, Time.now - 2.hours)

      #can :cancelar, Request, { :user_id => user.id, :status => "EM ABERTO" }

      can :cancelar, Request do |r|
        r.user_id == user.id and 
        Time.now < r.data_hora_partida - 2.hours and
        r.status != 'EM ABERTO' and
        r.status != 'FINALIZADA' and
        r.status != 'CANCELADA'         
      end

      can [:create, :read], Passenger
      can [:create, :read], Destiny, {:tipo => "DESLOCAMENTO URBANO"}
       
      #cannot :request_destinies, Request.where("user_id = ? and status != ?", user.id,"EM ABERTO")

    end

    

    

  end
end
