class AddCamposToProjeto < ActiveRecord::Migration
  def change
    add_column :projetos, :objetivo, :text
    add_column :projetos, :data_inicial, :date
    add_column :projetos, :data_final, :date
  end
end
