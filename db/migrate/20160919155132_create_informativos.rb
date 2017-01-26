class CreateInformativos < ActiveRecord::Migration
  def change
    create_table :informativos do |t|
      t.string :tipo
      t.string :titulo
      t.text :informacoes
      t.boolean :publicado, default: :false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
