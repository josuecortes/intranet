class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :update_sanitized_params, if: :devise_controller?
  
  before_filter :authenticate_user!

  before_filter :esta_ativo

  before_filter :data_nascimento_preenchida

  skip_before_filter :esta_ativo, if: :devise_controller?

  skip_before_filter :data_nascimento_preenchida, if: :devise_controller?

  def update_sanitized_params

    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit({role_ids: []}, :name, :cpf, :avatar, :nascimento, :departamento_id, :ativo, :mudar_senha, :email, :password, :password_confirmation,
                                                           :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip,
                                                           :current_password, :last_sign_in_ip)

    end

    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({role_ids: []}, :name, :cpf, :avatar, :nascimento, :departamento_id, :ativo, :mudar_senha, :email, :password, :password_confirmation,
                                                           :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip,
                                                           :current_password, :last_sign_in_ip)

    end

  end
  

  @@msge = "A operação não pôde ser concluída..."
  @@msgs = "Operação concluída com sucesso!"

  @@per_page = 10

  def esta_ativo
    if user_signed_in?
      if current_user.ativo == false
        flash[:info] = "Sua conta esta desativada! Contate o administrador do sistema para reativar sua conta"
        sign_out(current_user)
        redirect_to root_url
      elsif current_user.ativo == true and current_user.mudar_senha == true
        flash[:info] = "Você Precisa Mudar a Sua Senha. Sua Senha Atual é: 12345678"
        redirect_to edit_user_registration_path
      end
    end
  end

  def data_nascimento_preenchida
    if user_signed_in?
      if current_user.nascimento.blank? or current_user.nascimento == ""
        flash[:info] = "Você precisa preenher o campo data de nascimento. Aproveite para adicionar uma foto ao seu perfil."
        redirect_to edit_user_registration_path
      end
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    home_index_path
  end
  
  protected
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.home_nao_autorizado_url
  end

end