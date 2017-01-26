class AddTipoEquipamentoAndStatusEquipamentoAndDepartamentoToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :tipo_equipamento_id, :integer
    add_column :equipamentos, :status_equipamento_id, :integer
    add_column :equipamentos, :departamento_id, :integer
  end
end
