class AddMotivoToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :motivo, :text
  end
end
