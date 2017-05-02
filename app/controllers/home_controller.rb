class HomeController < ApplicationController
  def index
  	@meus_chamados = Chamado.where('user_id = ?', current_user.id)
  	@chamados = Chamado.all
  	@usuarios = User.all
   	@incidentes = Incidente.order('data_inicio DESC').all
    @inci_acontecendo = Incidente.order('data_inicio DESC').where(:status=>"ACONTECENDO").all

    @minhas_ordens = Ordem.where('cliente_id = ?', current_user.id)

   	@abertos = Chamado.where(:status=>"ABERTO").order('created_at ASC')
   	@atendendo = Chamado.where(:status=>"EM ATENDIMENTO",:tecnico_id=>current_user.id).order('data_status_em_atendimento ASC')

    @ordens_atendendo = Ordem.where.not(status: "FECHADO").where(:user_id=>current_user.id).order('data_status_aberto ASC')

    puts "a ordem agora"

    puts @ordens_atendendo.count

    puts "contou"
  end

  def nao_autorizado
  end
end
