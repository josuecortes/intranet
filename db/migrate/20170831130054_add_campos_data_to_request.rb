class AddCamposDataToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :data_hora_partida, :datetime
    add_column :requests, :data_hora_volta, :datetime
  end
end
