class CreateJoinTableUserEtapa < ActiveRecord::Migration
  def change
    create_join_table :users, :etapas do |t|
      t.index [:user_id, :etapa_id]
      t.index [:etapa_id, :user_id]
    end
  end
end
