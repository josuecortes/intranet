class AddDepartamentoEmprestimoToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :departamento_emprestimo_id, :integer
  end
end
