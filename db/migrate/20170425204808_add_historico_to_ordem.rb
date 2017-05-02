class AddHistoricoToOrdem < ActiveRecord::Migration
  def change
    add_column :ordems, :historico, :text
  end
end
