class AddVariosCamposToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :doador, :string
    add_column :equipamentos, :proprietario, :string
    add_column :equipamentos, :escola_id, :integer
    add_column :equipamentos, :orgao_id, :integer
  end
end
