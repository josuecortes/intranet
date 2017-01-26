class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :tipo
      t.string :titulo
      t.text :informacoes
      t.datetime :data_hora
      t.boolean :publicado, default: :false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
