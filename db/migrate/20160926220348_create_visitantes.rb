class CreateVisitantes < ActiveRecord::Migration
  def change
    create_table :visitantes do |t|
      t.string :nome
      t.string :rg
      t.string :cpf

      t.timestamps null: false
    end
  end
end
