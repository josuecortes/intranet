class RemoveCamposHorasFromRequest < ActiveRecord::Migration
  def change
    remove_column :requests, :hora_partida, :time
    remove_column :requests, :hora_volta, :time
  end
end
