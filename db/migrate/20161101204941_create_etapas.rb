class CreateEtapas < ActiveRecord::Migration
  def change
    create_table :etapas do |t|
      t.string :nome
      t.string :data_inicio
      t.string :data_final
      t.string :status

      t.timestamps null: false
    end
  end
end
