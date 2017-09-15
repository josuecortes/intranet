class RemoveVariosCampos2FromRequest < ActiveRecord::Migration
  def change
  	remove_column :requests, :data_aguardando_cad, :time
    remove_column :requests, :user_aguardando_cad_id, :integer
    remove_column :requests, :data_aguardando_useget, :time
    remove_column :requests, :user_aguardando_useget_id, :integer
    remove_column :requests, :data_aprovada, :time
    remove_column :requests, :user_aprovada_id, :integer
    remove_column :requests, :data_em_andamento, :time
    remove_column :requests, :user_data_em_andamento_id, :integer
    remove_column :requests, :data_finalizada, :time
    remove_column :requests, :user_finalizada_id, :integer
    remove_column :requests, :data_cancelada, :time
    remove_column :requests, :user_cancelada_id, :integer
    remove_column :requests, :motivo_cancelamento, :text
  end
end
