class AddCodigoToPosto < ActiveRecord::Migration
  def change
    add_column :postos, :codigo, :string
  end
end
