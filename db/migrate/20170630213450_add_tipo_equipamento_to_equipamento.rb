class AddTipoEquipamentoToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :tipo_equipamento, :integer
  end
end
