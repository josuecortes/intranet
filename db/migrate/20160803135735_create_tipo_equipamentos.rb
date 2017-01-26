class CreateTipoEquipamentos < ActiveRecord::Migration
  def change
    create_table :tipo_equipamentos do |t|
      t.string :tipo

      t.timestamps null: false
    end
  end
end
