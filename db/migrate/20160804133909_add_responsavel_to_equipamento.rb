class AddResponsavelToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :responsavel, :string
  end
end
