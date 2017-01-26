class AddNascimentoToUser < ActiveRecord::Migration
  def change
    add_column :users, :nascimento, :string
  end
end
