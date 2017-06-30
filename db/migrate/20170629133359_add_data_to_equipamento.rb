class AddDataToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :data_aquisicao, :date
  end
end
