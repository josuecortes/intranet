class AddDataPatrimonio2ToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :data_patrimonio, :string
  end
end
