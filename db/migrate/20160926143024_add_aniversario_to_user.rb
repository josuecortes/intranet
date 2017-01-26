class AddAniversarioToUser < ActiveRecord::Migration
  def change
    add_column :users, :aniversario, :datetime
  end
end
