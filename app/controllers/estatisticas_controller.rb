class EstatisticasController < ApplicationController



  def index

    authorize! :show, :estatisticas

  	if params[:mini].blank?
  		#@mini = Date.today.beginning_of_month
      @mini = DateTime.now.month
    else
      @mini = params[:mini]
    end

    if params[:mfim].blank?
  		#@mfim = Date.today.end_of_month
      @mfim = DateTime.now.month
    else
      @mfim = params[:mfim]
    end


    if params[:aini].blank?
      #@mini = Date.today.beginning_of_month
      @aini = DateTime.now.year
    else
      @aini = params[:aini]
    end

    if params[:afim].blank?
      #@mfim = Date.today.end_of_month
      @afim = DateTime.now.year
    else
      @afim = params[:afim]
    end

    @ini = "#{@mini}/#{@aini}".to_time.beginning_of_month
    @fim = "#{@mfim}/#{@afim}".to_time.end_of_month


    if @ini > @fim
      @ini = Time.now.beginning_of_month
      @fim = Time.now.today.end_of_month
      flash[:info] = "A data final era maior que a data inicial."
    end

    @meses = [["Janeiro",1],
    ["Fevereiro",2],
    ["Março",3],
    ["Abril",4],
    ["Maio",5],
    ["Junho",6],
    ["Julho",7],
    ["Agosto",8],
    ["Setembro",9],
    ["Outubro",10],
    ["Novembro",11],
    ["Dezembro",12]]

    #r = Role.find_by(nome: "ADMINISTRADOR") MUDAR PRA DESENVOLVIMENTO
    #r = Role.find_by(nome: "NUINFO")

    #@usuarios = User.all.sort_by{|u| u.responsavel.no_periodo(@ini,@fim).count}.reverse
    #@chamados = User.all.sort_by{|u| u.chamados.no_periodo(@ini,@fim).count}.reverse

    @chamados = Chamado.no_periodo(@ini, @fim)

    r = Role.where(:nome=>"TECNICO").first

    @tecnicos = r.users

    r2 = Role.where(:nome=>"REQUISITANTE").first

    @normais = User.all

    @departamentos = Departamento.all

    @problemas = Problema.all


  end

  def admin
    authorize! :show, :estatisticas_admins

    if params[:mini].blank?
      #@mini = Date.today.beginning_of_month
      @mini = DateTime.now.month
    else
      @mini = params[:mini]
    end

    if params[:mfim].blank?
      #@mfim = Date.today.end_of_month
      @mfim = DateTime.now.month
    else
      @mfim = params[:mfim]
    end


    if params[:aini].blank?
      #@mini = Date.today.beginning_of_month
      @aini = DateTime.now.year
    else
      @aini = params[:aini]
    end

    if params[:afim].blank?
      #@mfim = Date.today.end_of_month
      @afim = DateTime.now.year
    else
      @afim = params[:afim]
    end

    @ini = "#{@mini}/#{@aini}".to_time.beginning_of_month
    @fim = "#{@mfim}/#{@afim}".to_time.end_of_month


    if @ini > @fim
      @ini = Time.now.beginning_of_month
      @fim = Time.now.end_of_month
      flash[:info] = "A data final era maior que a data inicial."
    end

    @meses = [["Janeiro",1],
    ["Fevereiro",2],
    ["Março",3],
    ["Abril",4],
    ["Maio",5],
    ["Junho",6],
    ["Julho",7],
    ["Agosto",8],
    ["Setembro",9],
    ["Outubro",10],
    ["Novembro",11],
    ["Dezembro",12]]

    #r = Role.find_by(nome: "ADMINISTRADOR") MUDAR PRA DESENVOLVIMENTO
    #r = Role.find_by(nome: "NUINFO")

    #@usuarios = User.all.sort_by{|u| u.responsavel.no_periodo(@ini,@fim).count}.reverse
    #@chamados = User.all.sort_by{|u| u.chamados.no_periodo(@ini,@fim).count}.reverse

    @chamados = Chamado.no_periodo(@ini, @fim)

    r = Role.where(:nome=>"TECNICO").first

    @tecnicos = r.users

    r2 = Role.where(:nome=>"REQUISITANTE").first

    @normais = User.all

    @departamentos = Departamento.all

    @problemas = Problema.all

  end

  def equipamentos

    authorize! :show, :estatisticas_equipamentos

    @departamentos = Departamento.all
    @estados = StatusEquipamento.all
    @tipos = TipoEquipamento.all
    @detalhes_equipamentos = DetalhesEquipamento.all

    @equipamentos = Equipamento.all

    if !params[:departamento].blank?
      @departamento = params[:departamento]
      @equipamentos = @equipamentos.do_departamento(@departamento)
    end

    if !params[:estado].blank?
      @estado = params[:estado]
      @equipamentos = @equipamentos.no_estado(@estado)
    end

    if !params[:tipo].blank?
      @tipo = params[:tipo]
      @equipamentos = @equipamentos.do_tipo(@tipo)
    end

    if !params[:detalhe].blank?
      @detalhe = params[:detalhe]
      @equipamentos = @equipamentos.do_detalhe(@detalhe)
    end

  end

end
