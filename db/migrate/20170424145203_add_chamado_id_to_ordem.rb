class AddChamadoIdToOrdem < ActiveRecord::Migration
  def change
    add_column :ordems, :chamado_id, :integer
  end
end
