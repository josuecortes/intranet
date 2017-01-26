class CreateJoinTableProjetoUser < ActiveRecord::Migration
  def change
    create_join_table :projetos, :users do |t|
      t.index [:projeto_id, :user_id]
      t.index [:user_id, :projeto_id]
    end
  end
end
