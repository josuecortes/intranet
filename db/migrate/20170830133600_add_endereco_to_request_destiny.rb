class AddEnderecoToRequestDestiny < ActiveRecord::Migration
  def change
    add_column :request_destinies, :endereco, :text
  end
end
