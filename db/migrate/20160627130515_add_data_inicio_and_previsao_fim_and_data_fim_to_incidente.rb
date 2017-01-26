class AddDataInicioAndPrevisaoFimAndDataFimToIncidente < ActiveRecord::Migration
  def change
    add_column :incidentes, :data_inicio, :string
    add_column :incidentes, :previsao_fim, :string
    add_column :incidentes, :data_fim, :string
  end
end
