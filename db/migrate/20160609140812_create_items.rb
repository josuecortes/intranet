class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
