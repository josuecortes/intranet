class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :tipo
      t.date :data_partida
      t.date :data_volta
      t.time :hora_partida
      t.time :hora_volta
      t.string :status
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
