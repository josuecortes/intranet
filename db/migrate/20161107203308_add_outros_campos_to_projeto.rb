class AddOutrosCamposToProjeto < ActiveRecord::Migration
  def change
    add_column :projetos, :departamento_id, :integer
    add_column :projetos, :local, :string
    add_column :projetos, :metodo, :string
    add_column :projetos, :custo, :string
  end
end
