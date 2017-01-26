class CreateStatusEquipamentos < ActiveRecord::Migration
  def change
    create_table :status_equipamentos do |t|
      t.string :status

      t.timestamps null: false
    end
  end
end
