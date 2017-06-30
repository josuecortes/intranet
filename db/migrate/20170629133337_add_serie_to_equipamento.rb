class AddSerieToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :serie, :string
  end
end
