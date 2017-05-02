class AddCabecalhoToOrdem < ActiveRecord::Migration
  def change
    add_column :ordems, :cabecalho, :string
  end
end
