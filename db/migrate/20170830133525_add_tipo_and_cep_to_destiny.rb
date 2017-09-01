class AddTipoAndCepToDestiny < ActiveRecord::Migration
  def change
    add_column :destinies, :tipo, :string
    add_column :destinies, :cep, :string
  end
end
