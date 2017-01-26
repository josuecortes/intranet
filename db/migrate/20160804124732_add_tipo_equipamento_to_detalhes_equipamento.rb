class AddTipoEquipamentoToDetalhesEquipamento < ActiveRecord::Migration
  def change
    add_column :detalhes_equipamentos, :tipo_equipamento_id, :integer
  end
end
