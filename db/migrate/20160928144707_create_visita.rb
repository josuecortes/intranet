class CreateVisita < ActiveRecord::Migration
  def change
    create_table :visita do |t|
      t.integer :visitante_id
      t.integer :departamento_id
      t.text :observacoes
      t.datetime :entrada
      t.datetime :saida

      t.timestamps null: false
    end
  end
end
