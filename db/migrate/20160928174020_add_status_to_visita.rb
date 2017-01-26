class AddStatusToVisita < ActiveRecord::Migration
  def change
    add_column :visita, :status, :string
  end
end
