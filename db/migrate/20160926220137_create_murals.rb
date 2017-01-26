class CreateMurals < ActiveRecord::Migration
  def change
    create_table :murals do |t|
      t.text :texto
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
