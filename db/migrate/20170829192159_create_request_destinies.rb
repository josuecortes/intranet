class CreateRequestDestinies < ActiveRecord::Migration
  def change
    create_table :request_destinies do |t|
      t.integer :request_id
      t.integer :destiny_id

      t.timestamps null: false
    end
  end
end
