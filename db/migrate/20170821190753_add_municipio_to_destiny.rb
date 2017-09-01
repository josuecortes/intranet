class AddMunicipioToDestiny < ActiveRecord::Migration
  def change
    add_column :destinies, :municipio, :string
  end
end
