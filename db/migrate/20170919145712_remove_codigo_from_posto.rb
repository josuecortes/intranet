class RemoveCodigoFromPosto < ActiveRecord::Migration
  def change
    remove_column :postos, :codigo, :integer
  end
end
