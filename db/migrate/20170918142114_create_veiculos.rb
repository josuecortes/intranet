class CreateVeiculos < ActiveRecord::Migration
  def change
    create_table :veiculos do |t|
      t.string :tipo
      t.string :marca
      t.string :modelo
      t.string :ano
      t.string :cor
      t.string :placa
      t.string :combustivel
      t.date :validade_documento
      t.integer :capacidade
      t.boolean :carga
      t.string :status
      t.integer :posto_id
      t.integer :motorista_id

      t.timestamps null: false
    end
  end
end
