class CreateDetalhesEquipamentos < ActiveRecord::Migration
  def change
    create_table :detalhes_equipamentos do |t|
      t.string :modelo
      t.string :configuracao

      t.timestamps null: false
    end
  end
end
