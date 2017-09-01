class AddVariosCamposControleToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :data_aguardando_cad, :time
    add_column :requests, :user_aguardando_cad_id, :integer
    add_column :requests, :data_aguardando_useget, :time
    add_column :requests, :user_aguardando_useget_id, :integer
    add_column :requests, :data_aprovada, :time
    add_column :requests, :user_aprovada_id, :integer
    add_column :requests, :data_em_andamento, :time
    add_column :requests, :user_data_em_andamento_id, :integer
    add_column :requests, :data_finalizada, :time
    add_column :requests, :user_finalizada_id, :integer
    add_column :requests, :data_cancelada, :time
    add_column :requests, :user_cancelada_id, :integer
    add_column :requests, :motivo_cancelamento, :text
  end
end
