class CreateProjetos < ActiveRecord::Migration
  def change
    create_table :projetos do |t|
      t.string :nome
      t.text :resumo
      t.string :status
      t.boolean :publicado, default: :false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
