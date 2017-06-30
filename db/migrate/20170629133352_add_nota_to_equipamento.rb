class AddNotaToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :nota, :string
  end
end
