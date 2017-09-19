class CreateMotorista < ActiveRecord::Migration
  def change
    create_table :motorista do |t|
      t.string :nome
      t.string :cnh
      t.string :categoria
      t.date :validade
      t.string :contato
      t.string :status

      t.timestamps null: false
    end
  end
end
