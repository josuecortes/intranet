class AddPortariaToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :portaria, :string
  end
end
