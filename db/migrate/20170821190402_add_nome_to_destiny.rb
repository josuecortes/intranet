class AddNomeToDestiny < ActiveRecord::Migration
  def change
    add_column :destinies, :nome, :string
  end
end
