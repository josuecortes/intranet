class CreateJoinTableProjetoDepartamento < ActiveRecord::Migration
  def change
    create_join_table :projetos, :departamentos do |t|
      t.index [:projeto_id, :departamento_id]
      t.index [:departamento_id, :projeto_id]
    end
  end
end
