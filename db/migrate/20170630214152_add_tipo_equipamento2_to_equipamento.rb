class AddTipoEquipamento2ToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :tipo_equipamento_id, :integer
  end
end
