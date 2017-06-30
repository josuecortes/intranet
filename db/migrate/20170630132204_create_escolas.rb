class CreateEscolas < ActiveRecord::Migration
  def change
    create_table :escolas do |t|
      t.string :nome
      t.string :codigo
      t.string :email
      t.integer :muncipio_id
      t.string :contato
      t.string :tipo

      t.timestamps null: false
    end
  end
end
