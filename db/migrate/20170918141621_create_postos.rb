class CreatePostos < ActiveRecord::Migration
  def change
    create_table :postos do |t|
      t.string :codigo
      t.string :tipo
      t.integer :kms_total
      t.integer :kms_usado
      t.string :status

      t.timestamps null: false
    end
  end
end
