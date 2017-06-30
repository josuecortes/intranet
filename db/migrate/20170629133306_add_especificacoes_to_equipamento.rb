class AddEspecificacoesToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :especificacoes, :text
  end
end
