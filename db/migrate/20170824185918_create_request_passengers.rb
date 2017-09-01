class CreateRequestPassengers < ActiveRecord::Migration
  def change
    create_table :request_passengers do |t|
      t.integer :request_id
      t.integer :passenger_id

      t.timestamps null: false
    end
  end
end
