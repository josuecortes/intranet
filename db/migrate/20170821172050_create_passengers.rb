class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :nome
      t.string :tipo
      t.string :matricula
      t.string :cpf
      t.text :respaldo

      t.timestamps null: false
    end
  end
end
