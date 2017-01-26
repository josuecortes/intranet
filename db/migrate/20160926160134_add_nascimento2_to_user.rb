class AddNascimento2ToUser < ActiveRecord::Migration
  def change
    add_column :users, :nascimento, :date	
  end
end
