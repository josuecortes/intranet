class AddMacToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :mac, :string
  end
end
