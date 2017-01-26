class RemoverDataEquipamento < ActiveRecord::Migration
  def change
  	remove_column :equipamentos, :data_patrimonio, :date
  end
end
