class AddLatitudeAndLongitudeToDestiny < ActiveRecord::Migration
  def change
    add_column :destinies, :latitude, :float
    add_column :destinies, :longitude, :float
  end
end
