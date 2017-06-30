class AddDescricaoToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :descricao, :text
  end
end
