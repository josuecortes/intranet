class AddBooleansToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :carga, :boolean, default: false
    add_column :requests, :documento, :boolean, default: false
    add_column :requests, :urgente, :boolean, default: false
  end
end
