class RemoveCampos < ActiveRecord::Migration
  def change
  	remove_column :equipamentos, :tipo_equipamento_id, :integer
  	remove_column :equipamentos, :modelo, :string
  	remove_column :equipamentos, :configuracoes, :string
  end
end
