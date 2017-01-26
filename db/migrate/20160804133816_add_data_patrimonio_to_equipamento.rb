class AddDataPatrimonioToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :data_patrimonio, :date
  end
end
