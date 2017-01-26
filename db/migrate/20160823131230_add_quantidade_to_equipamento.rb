class AddQuantidadeToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :quantidade, :integer
  end
end
