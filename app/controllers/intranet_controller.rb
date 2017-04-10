class IntranetController < ApplicationController
	skip_before_filter :authenticate_user!
	#layout "intranet"
  def index
  	@agendas = Agenda.where("data_hora >= ?",Time.now).publicado.order('data_hora ASC').limit(6)
  	@informativos = Informativo.where('tipo != ?', 'NOTÍCIA RAPIDA').order('created_at DESC').publicado.limit(9)
  	@inci_acontecendo = Incidente.order('data_inicio DESC').where(:status=>"ACONTECENDO").all
  	@projetos = Projeto.order('created_at DESC').publicado.limit(6)
		@noticias_rapidas = Informativo.where('tipo = ?', 'NOTÍCIA RAPIDA').order('created_at DESC').publicado.limit(6)

    @mural = Mural.order('created_at DESC').limit(60)

    @visitas = Visitum.order('created_at DESC').em_visita.all

    #@usuarios = User.all
    @nesta_semana = []
    User.all.each do |usuario|
      if !usuario.nascimento.blank?
        aniversario = "#{usuario.nascimento.day}/#{usuario.nascimento.month}/#{DateTime.now.year}".to_date
        if aniversario >= DateTime.now.beginning_of_week and aniversario <= DateTime.now.end_of_week
          @nesta_semana << usuario
        end
      end
    end

    @mu = Mural.new

  end

  def salvar_mural

    @mu = Mural.new(mural_params)

    respond_to do |format|
      if @mu.save
        format.html { redirect_to intranet_index_path, notice: @@msgs }
        format.json { render :index, status: :created, location: @mu }
      else
        format.html { redirect_to intranet_index_path, notice: @@msge }
        format.json { render json: @mu.errors, status: :unprocessable_entity }
      end
    end

  end

  def incidentes
    @incidentes = Incidente.order('data_inicio DESC')
  end

  def incidente_show
    @incidente = Incidente.find(params[:incidente_id])
  end

  def agendas
    @agendas = Agenda.where("data_hora >= ?",Time.now).publicado.order('data_hora ASC')
  end

  def agenda_show
    @agenda = Agenda.publicado.find(params[:agenda_id])
  end

  def informativos
    @informativos = Informativo.publicado.order('created_at DESC').all
  end

  def informativo_show
    @informativo = Informativo.publicado.find(params[:informativo_id])
  end

  def projetos
    @projetos = Projeto.publicado.order('created_at DESC').all
  end

  def projeto_show
    @projeto = Projeto.publicado.find(params[:projeto_id])
  end

  def lista_emails
  	@emails = User.all
  end

  def lista_departamentos
  	@departamentos = Departamento.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def mural_params
      params.require(:mural).permit(:texto, :user_id)
    end

end
