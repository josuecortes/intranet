class AddProjetoToEtapa < ActiveRecord::Migration
  def change
    add_column :etapas, :projeto_id, :integer
  end
end
