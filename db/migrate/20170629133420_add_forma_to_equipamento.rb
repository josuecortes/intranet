class AddFormaToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :forma_aquisicao, :string
  end
end
