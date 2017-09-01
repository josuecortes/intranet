class CreateDestinies < ActiveRecord::Migration
  def change
    create_table :destinies do |t|
      t.string :municipo
      t.string :bairro
      t.string :logradouro
      t.string :numero
      t.string :portaria
      t.text :descricao

      t.timestamps null: false
    end
  end
end
