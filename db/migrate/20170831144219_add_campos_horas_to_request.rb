class AddCamposHorasToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :hora_partida, :string
    add_column :requests, :hora_volta, :string
  end
end
