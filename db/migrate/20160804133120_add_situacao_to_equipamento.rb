class AddSituacaoToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :situacao, :string
  end
end
