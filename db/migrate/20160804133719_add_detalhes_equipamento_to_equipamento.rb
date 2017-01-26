class AddDetalhesEquipamentoToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :detalhes_equipamento_id, :integer
  end
end
