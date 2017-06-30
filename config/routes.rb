Rails.application.routes.draw do

  resources :escolas

  resources :orgaos

  resources :ordems do

    get :fechar_ordem

    get :aguardando_ordem

    get :liberar_equipamento

    get :concluir_ordem

    get :em_atendimento, :on => :collection

    get :concluidos, :on => :collection

    get :cancelados, :on => :collection

    get :aguardando, :on => :collection

    get :fechados, :on => :collection


  end

  get 'admin/index'

  get 'status/index'

  #mount Ckeditor::Engine => '/ckeditor'
  #resources :visita

  resources :visitantes do

    resources :visita

    #get :entrada

    #post :salvar_entrada

    #get :saida

    #put :salvar_saida

    get :autocomplete_departamento_nome, :on => :collection

  end

  resources :murals

  resources :projetos do

    resources :etapas

    get :participantes

    get :salvar_participante

    get :remover_participante

  end

  resources :agendas

  resources :informativos do

    resources :arquivos

  end

  post 'intranet/salvar_mural'

  get 'intranet/index'

  get 'intranet/incidentes'

  get 'intranet/incidente_show'

  get 'intranet/projetos'

  get 'intranet/projeto_show'

  get 'intranet/agendas'

  get 'intranet/agenda_show'

  get 'intranet/informativos'

  get 'intranet/informativo_show'

  get 'intranet/lista_emails'

  get 'intranet/lista_departamentos'

  get 'estatisticas/index'

  get 'estatisticas/admin'

  get 'estatisticas/equipamentos'

  resources :detalhes_equipamentos

  resources :status_equipamentos

  resources :tipo_equipamentos

  resources :equipamentos do

    get :autocomplete_departamento_nome, :on => :collection
    get :autocomplete_departamento_emprestimo_nome, :on => :collection
    get :autocomplete_detalhes_equipamento_nome, :on => :collection

    get :autocomplete_escola_nome, :on => :collection
    get :autocomplete_orgao_nome, :on => :collection

  end

  resources :tipo_incidentes

  resources :incidentes do

    get :autocomplete_tipo_incidente_descricao, :on => :collection

  end

  resources :problemas

  resources :chamados do

    collection do

      get :abrir_chamado

      post :salvar_chamado

    end

    get :fechar_chamado

    get :cancelar_chamado

    get :pegar_chamado

    get :concluir_chamado

    get :em_atendimento, :on => :collection

    get :concluidos, :on => :collection

    get :cancelados, :on => :collection

    get :fechados, :on => :collection

    get :autocomplete_problema_descricao, :on => :collection

    get :autocomplete_user_name, :on => :collection

    resources :ordems

  end

  resources :inventarios

  resources :items

  resources :itens

  resources :departamentos

  get 'home/index'
  get 'home/nao_autorizado'

  resources :usuarios do

    get :redefinir_senha

    get :autocomplete_departamento_nome, :on => :collection

  end

  devise_for :users
  resources :users

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      #root 'devise/sessions#new', as: :unauthenticated_root
      root 'intranet#index', as: :unauthenticated_root
    end
  end

end
