class CreateEquipamentos < ActiveRecord::Migration
  def change
    create_table :equipamentos do |t|
      t.string :modelo
      t.string :configuracoes
      t.string :patrimonio

      t.timestamps null: false
    end
  end
end
