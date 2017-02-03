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
//= require jquery-ui/autocomplete
//= require autocomplete-rails
//= require app
//= require dashboard
//= require demo
// require npm
//= require jquery.mask.min
// require ckeditor/init


$(document).ready(function() {
  $('.data').mask('00/00/0000');
  $('.time').mask('00:00:00');
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



$(document).ready(function () {
      $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
  });
