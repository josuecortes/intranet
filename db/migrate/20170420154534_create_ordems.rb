class CreateOrdems < ActiveRecord::Migration
  def change
    create_table :ordems do |t|
      t.string :status
      t.datetime :data_status_aberto
      t.datetime :data_status_em_atendimento
      t.datetime :data_status_concluido
      t.datetime :data_status_aguardando
      t.datetime :data_status_fechado
      t.integer :user_id
      t.integer :cliente_id
      t.integer :departamento_id
      t.string :tipo_equipamento
      t.text :especificacoes
      t.text :condicoes
      t.text :problema
      t.text :acoes
      t.text :conversa

      t.timestamps null: false
    end
  end
end
