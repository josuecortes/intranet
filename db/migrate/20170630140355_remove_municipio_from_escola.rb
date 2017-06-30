class RemoveMunicipioFromEscola < ActiveRecord::Migration
  def change
    remove_column :escolas, :muncipio_id, :string
  end
end
