class RemoveCamposFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :nascimento, :string
  	remove_column :users, :aniversario, :datetime
  end
end
