class RemoveDataInicioAndPrevisaoFimAndDataFimToIncidente < ActiveRecord::Migration
  def change
  	remove_column :incidentes, :data_inicio 
  	remove_column :incidentes, :previsao_fim
  	remove_column :incidentes, :data_fim
  end
end
