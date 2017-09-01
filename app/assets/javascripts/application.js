// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap.min
//= require dataTables/jquery.dataTables
//= require datatables_responsive
//= require datatables_rowreorder
//= require autocomplete-rails
// require jquery-ui/autocomplete
//= require app
//= require dashboard
//= require demo
// require npm
//= require jquery.mask.min
// require ckeditor/init
//= require canvasjs.min
//= require dataTables.buttons.min
//= require buttons.flash.min
//= require jszip.min
//= require pdfmake.min
//= require vfs_fonts
//= require buttons.html5.min
//= require buttons.print.min
//= require jspdf
//= require jquery_nested_form
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.pt-BR
//= require bootstrap-timepicker
// require notifyjs

$(document).ready(function() {

  $(".datepicker").datepicker({format: 'dd/mm/yyyy',language: 'pt-BR', weekStart: 1, startDate: '1949-01-01' ,autoclose: true});

  $('.timepicker').timepicker();


  $('.data').mask('00/00/0000');
  $('.time').mask('00:00:00');
  $('.shorttime').mask('00:00');
  $('.date_time').mask('00/00/0000 00:00:00');
  $('.cep').mask('00000-000');
  $('.phone').mask('	0000-0000');
  $('.phone_with_ddd').mask('(00) 00000-0000');
  $('.phone_us').mask('(000) 000-0000');
  $('.mixed').mask('AAA 000-S0S');
  $('.cpf').mask('000.000.000-00', {reverse: true});
  $('.money').mask('000.000.000.000.000,00', {reverse: true});
  $('.money2').mask("#.##0,00", {reverse: true, maxlength: false});
  $('.ip_address').mask('0ZZ.0ZZ.0ZZ.0ZZ', {translation: {'Z': {pattern: /[0-9]/, optional: true}}});
  $('.ip_address').mask('099.099.099.099');
  $('.percent').mask('##0,00%', {reverse: true});

  $('.cnpj').mask('00.000.000/0000-00', {reverse: true});

  $('.aniversario').mask('00/00');

  $('.ordem').mask('000');

  $('.inci_data_ini').mask('00/00/0000 00:00');

  $('.inci_data_fim').mask('00/00/0000 00:00');

  $('.inci_data_prev').mask('00/00/0000 00:00');

  $('.telefone_normal').mask('0000-0000');


  $('.rg').mask("999999999999");

  $('#tamanho_img0').css('height', '350px', 'width', '100%');
  $('#tamanho_img1').css('height', '350px', 'width', '100%');
  $('#tamanho_img2').css('height', '350px', 'width', '100%');
  $('#tamanho_img3').css('height', '350px', 'width', '100%');
  $('#tamanho_img4').css('height', '350px', 'width', '100%');
  $('#tamanho_img5').css('height', '350px', 'width', '100%');
  $('#tamanho_img6').css('height', '350px', 'width', '100%');
  $('#tamanho_img7').css('height', '350px', 'width', '100%');
  $('#tamanho_img8').css('height', '350px', 'width', '100%');

  $('.equipamento_situacao').each(function(){
    var valor = $(this).val();
    if(valor == "COMPRA"){
      $('.equipamento_situacao_cessao').hide();
      $('.equipamento_situacao_doacao').hide();
      $('.equipamento_situacao_particular').hide();
      $('.equipamento_situacao_patrimonio').hide();
    } else if(valor == "CESSAO"){
      $('.equipamento_situacao_cessao').show();
      $('.equipamento_situacao_doacao').hide();
      $('.equipamento_situacao_particular').hide();
      $('.equipamento_situacao_patrimonio').hide();
    } else if(valor == "PATRIMONIO"){
      $('.equipamento_situacao_cessao').hide();
      $('.equipamento_situacao_doacao').hide();
      $('.equipamento_situacao_particular').hide();
      $('.equipamento_situacao_patrimonio').show();
    } else if(valor == "PARTICULAR") {
      $('.equipamento_situacao_cessao').hide();
      $('.equipamento_situacao_doacao').hide();
      $('.equipamento_situacao_particular').show();
      $('.equipamento_situacao_patrimonio').hide();
    } else if(valor == "DOACAO") {
      $('.equipamento_situacao_cessao').hide();
      $('.equipamento_situacao_doacao').show();
      $('.equipamento_situacao_particular').hide();
      $('.equipamento_situacao_patrimonio').hide();
    }
  });

  $('.equipamento_situacao').change(function(){
    var valor = $(this).val();
    if(valor == "COMPRA"){
      $('.equipamento_situacao_cessao').hide();
      $('.equipamento_situacao_doacao').hide();
      $('.equipamento_situacao_particular').hide();
      $('.equipamento_situacao_patrimonio').hide();
    } else if(valor == "CESSAO"){
      $('.equipamento_situacao_cessao').show();
      $('.equipamento_situacao_doacao').hide();
      $('.equipamento_situacao_particular').hide();
      $('.equipamento_situacao_patrimonio').hide();
    } else if(valor == "PATRIMONIO"){
      $('.equipamento_situacao_cessao').hide();
      $('.equipamento_situacao_doacao').hide();
      $('.equipamento_situacao_particular').hide();
      $('.equipamento_situacao_patrimonio').show();
    } else if(valor == "PARTICULAR") {
      $('.equipamento_situacao_cessao').hide();
      $('.equipamento_situacao_doacao').hide();
      $('.equipamento_situacao_particular').show();
      $('.equipamento_situacao_patrimonio').hide();
    } else if(valor == "DOACAO") {
      $('.equipamento_situacao_cessao').hide();
      $('.equipamento_situacao_doacao').show();
      $('.equipamento_situacao_particular').hide();
      $('.equipamento_situacao_patrimonio').hide();
    }
  });


  $('.tipo_request').each(function(){
    var valor = $(this).val();
    if(valor == "VIAGEM"){
        $('.viagem').show();
    } else {
      $('.viagem').hide();  
    }
  });

  $('.tipo_request').change(function(){
    var valor = $(this).val();
    if(valor == "VIAGEM"){
        $('.viagem').show();
    } else {
      $('.viagem').hide();  
    }
  });


  $('.check_urgencia').each(function(){
    var valor = $(this).val();
    if(valor == "true"){
        $('.urgencia').show();
    } else {
      $('.urgencia').hide();  
    }
  });

  $('.check_urgencia').change(function(){
    var valor = $(this).val();
    if(valor == "true"){
        $('.urgencia').show();
    } else {
      $('.urgencia').hide();  
    }
  });

  
  
  

});


$('table.display').dataTable({
  
  rowReorder: {
    selector: 'td:nth-child(2)'
  },
  responsive: true,
  "language": {
    "sProcessing":    "Processando...",
    "sLengthMenu":    "Mostrar _MENU_ Registros",
    "sZeroRecords":   "Nenhum registro encontrado",
    "sEmptyTable":    "Nenhum dado disponivel nesta tabela",
    "sInfo":          "Mostrando registros de _START_ ate _END_ de um total de _TOTAL_ registros",
    "sInfoEmpty":     "Mostrando registros de 0 a 0 de um total de 0 registros",
    "sInfoFiltered":  "(filtrado de um total de _MAX_ registros)",
    "sInfoPostFix":   "",
    "sSearch":        "Buscar:",
    "sUrl":           "",
    "sInfoThousands":  ",",
    "sLoadingRecords": "Carregando...",
    "oPaginate": {
      "sFirst":    "Primeiro",
      "sLast":    "Último",
      "sNext":    "Proximo",
      "sPrevious": "Anterior"
    },
    "oAria": {
      "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
      "sSortDescending": ": Activar para ordenar la columna de manera descendente"
    }
  }
});

$('table.display2').dataTable({
  dom: 'Bfrtip',
      buttons: [

          {
              extend: 'copy',
              title: 'Relatório Siscom'
          },

          {
              extend: 'csv',
              title: 'Relatório Siscom'
          },

          {
              extend: 'excel',
              title: 'Relatório Siscom'
          },

          {
              extend: 'pdf',
              title: 'Relatório Siscom'
          },

          {
              extend: 'print',
              title: 'Relatório Siscom'
          }

          
      ],

  rowReorder: {
    selector: 'td:nth-child(2)'
  },
  responsive: true,
  "language": {
    "sProcessing":    "Processando...",
    "sLengthMenu":    "Mostrar _MENU_ Registros",
    "sZeroRecords":   "Nenhum registro encontrado",
    "sEmptyTable":    "Nenhum dado disponivel nesta tabela",
    "sInfo":          "Mostrando registros de _START_ ate _END_ de um total de _TOTAL_ registros",
    "sInfoEmpty":     "Mostrando registros de 0 a 0 de um total de 0 registros",
    "sInfoFiltered":  "(filtrado de um total de _MAX_ registros)",
    "sInfoPostFix":   "",
    "sSearch":        "Buscar:",
    "sUrl":           "",
    "sInfoThousands":  ",",
    "sLoadingRecords": "Carregando...",
    "oPaginate": {
      "sFirst":    "Primeiro",
      "sLast":    "Último",
      "sNext":    "Proximo",
      "sPrevious": "Anterior"
    },
    "oAria": {
      "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
      "sSortDescending": ": Activar para ordenar la columna de manera descendente"
    }
  }
});


$('table.displaytecnico').dataTable({
  dom: 'Bfrtip',
      buttons: [

          {
              extend: 'copy',
              title: 'Relatório de Atendimento por Técnico - SISCOM|SEED'
          },

          {
              extend: 'csv',
              title: 'Relatório de Atendimento por Técnico - SISCOM|SEED'
          },

          {
              extend: 'excel',
              title: 'Relatório de Atendimento por Técnico - SISCOM|SEED'
          },

          {
              extend: 'pdf',
              title: 'Relatório de Atendimento por Técnico - SISCOM|SEED'
          },

          {
              extend: 'print',
              title: 'Relatório de Atendimento por Técnico - SISCOM|SEED'
          }

          
      ],

  rowReorder: {
    selector: 'td:nth-child(2)'
  },
  responsive: true,
  "language": {
    "sProcessing":    "Processando...",
    "sLengthMenu":    "Mostrar _MENU_ Registros",
    "sZeroRecords":   "Nenhum registro encontrado",
    "sEmptyTable":    "Nenhum dado disponivel nesta tabela",
    "sInfo":          "Mostrando registros de _START_ ate _END_ de um total de _TOTAL_ registros",
    "sInfoEmpty":     "Mostrando registros de 0 a 0 de um total de 0 registros",
    "sInfoFiltered":  "(filtrado de um total de _MAX_ registros)",
    "sInfoPostFix":   "",
    "sSearch":        "Buscar:",
    "sUrl":           "",
    "sInfoThousands":  ",",
    "sLoadingRecords": "Carregando...",
    "oPaginate": {
      "sFirst":    "Primeiro",
      "sLast":    "Último",
      "sNext":    "Proximo",
      "sPrevious": "Anterior"
    },
    "oAria": {
      "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
      "sSortDescending": ": Activar para ordenar la columna de manera descendente"
    }
  }
});


$('table.displayusuario').dataTable({
  dom: 'Bfrtip',
      buttons: [

          {
              extend: 'copy',
              title: 'Relatório de Abertura por Usuário - SISCOM|SEED'
          },

          {
              extend: 'csv',
              title: 'Relatório de Abertura por Usuário - SISCOM|SEED'
          },

          {
              extend: 'excel',
              title: 'Relatório de Abertura por Usuário - SISCOM|SEED'
          },

          {
              extend: 'pdf',
              title: 'Relatório de Abertura por Usuário - SISCOM|SEED'
          },

          {
              extend: 'print',
              title: 'Relatório de Abertura por Usuário - SISCOM|SEED'
          }

          
      ],

  rowReorder: {
    selector: 'td:nth-child(2)'
  },
  responsive: true,
  "language": {
    "sProcessing":    "Processando...",
    "sLengthMenu":    "Mostrar _MENU_ Registros",
    "sZeroRecords":   "Nenhum registro encontrado",
    "sEmptyTable":    "Nenhum dado disponivel nesta tabela",
    "sInfo":          "Mostrando registros de _START_ ate _END_ de um total de _TOTAL_ registros",
    "sInfoEmpty":     "Mostrando registros de 0 a 0 de um total de 0 registros",
    "sInfoFiltered":  "(filtrado de um total de _MAX_ registros)",
    "sInfoPostFix":   "",
    "sSearch":        "Buscar:",
    "sUrl":           "",
    "sInfoThousands":  ",",
    "sLoadingRecords": "Carregando...",
    "oPaginate": {
      "sFirst":    "Primeiro",
      "sLast":    "Último",
      "sNext":    "Proximo",
      "sPrevious": "Anterior"
    },
    "oAria": {
      "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
      "sSortDescending": ": Activar para ordenar la columna de manera descendente"
    }
  }
});


$('table.displaydepartamento').dataTable({
  dom: 'Bfrtip',
      buttons: [

          {
              extend: 'copy',
              title: 'Relatório de Abertura por Departamento - SISCOM|SEED'
          },

          {
              extend: 'csv',
              title: 'Relatório de Abertura por Departamento - SISCOM|SEED'
          },

          {
              extend: 'excel',
              title: 'Relatório de Abertura por Departamento - SISCOM|SEED'
          },

          {
              extend: 'pdf',
              title: 'Relatório de Abertura por Departamento - SISCOM|SEED'
          },

          {
              extend: 'print',
              title: 'Relatório de Abertura por Departamento - SISCOM|SEED'
          }

          
      ],

  rowReorder: {
    selector: 'td:nth-child(2)'
  },
  responsive: true,
  "language": {
    "sProcessing":    "Processando...",
    "sLengthMenu":    "Mostrar _MENU_ Registros",
    "sZeroRecords":   "Nenhum registro encontrado",
    "sEmptyTable":    "Nenhum dado disponivel nesta tabela",
    "sInfo":          "Mostrando registros de _START_ ate _END_ de um total de _TOTAL_ registros",
    "sInfoEmpty":     "Mostrando registros de 0 a 0 de um total de 0 registros",
    "sInfoFiltered":  "(filtrado de um total de _MAX_ registros)",
    "sInfoPostFix":   "",
    "sSearch":        "Buscar:",
    "sUrl":           "",
    "sInfoThousands":  ",",
    "sLoadingRecords": "Carregando...",
    "oPaginate": {
      "sFirst":    "Primeiro",
      "sLast":    "Último",
      "sNext":    "Proximo",
      "sPrevious": "Anterior"
    },
    "oAria": {
      "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
      "sSortDescending": ": Activar para ordenar la columna de manera descendente"
    }
  }
});


$('table.displayproblema').dataTable({
  dom: 'Bfrtip',
      buttons: [

          {
              extend: 'copy',
              title: 'Relatório de Abertura por Problema/Solicitação - SISCOM|SEED'
          },

          {
              extend: 'csv',
              title: 'Relatório de Abertura por Problema/Solicitação - SISCOM|SEED'
          },

          {
              extend: 'excel',
              title: 'Relatório de Abertura por Problema/Solicitação - SISCOM|SEED'
          },

          {
              extend: 'pdf',
              title: 'Relatório de Abertura por Problema/Solicitação - SISCOM|SEED'
          },

          {
              extend: 'print',
              title: 'Relatório de Abertura por Problema/Solicitação - SISCOM|SEED'
          }

          
      ],

  rowReorder: {
    selector: 'td:nth-child(2)'
  },
  responsive: true,
  "language": {
    "sProcessing":    "Processando...",
    "sLengthMenu":    "Mostrar _MENU_ Registros",
    "sZeroRecords":   "Nenhum registro encontrado",
    "sEmptyTable":    "Nenhum dado disponivel nesta tabela",
    "sInfo":          "Mostrando registros de _START_ ate _END_ de um total de _TOTAL_ registros",
    "sInfoEmpty":     "Mostrando registros de 0 a 0 de um total de 0 registros",
    "sInfoFiltered":  "(filtrado de um total de _MAX_ registros)",
    "sInfoPostFix":   "",
    "sSearch":        "Buscar:",
    "sUrl":           "",
    "sInfoThousands":  ",",
    "sLoadingRecords": "Carregando...",
    "oPaginate": {
      "sFirst":    "Primeiro",
      "sLast":    "Último",
      "sNext":    "Proximo",
      "sPrevious": "Anterior"
    },
    "oAria": {
      "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
      "sSortDescending": ": Activar para ordenar la columna de manera descendente"
    }
  }
});


$(document).ready(function () {
      $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
  });



