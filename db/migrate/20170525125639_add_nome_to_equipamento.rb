class AddNomeToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :nome, :string
  end
end
