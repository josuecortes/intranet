class CreateArquivos < ActiveRecord::Migration
  def change
    create_table :arquivos do |t|
      t.string :nome
      t.integer :informativo_id

      t.timestamps null: false
    end
  end
end
