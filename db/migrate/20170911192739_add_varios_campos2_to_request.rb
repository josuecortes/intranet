class AddVariosCampos2ToRequest < ActiveRecord::Migration
  def change
  	add_column :requests, :data_aguardando_cad, :datetime
    add_column :requests, :user_aguardando_cad_id, :integer
    add_column :requests, :data_aguardando_useget, :datetime
    add_column :requests, :user_aguardando_useget_id, :integer
    add_column :requests, :data_aprovada, :datetime
    add_column :requests, :user_aprovada_id, :integer
    add_column :requests, :data_em_andamento, :datetime
    add_column :requests, :user_em_andamento_id, :integer
    add_column :requests, :data_finalizada, :datetime
    add_column :requests, :user_finalizada_id, :integer
    add_column :requests, :data_cancelada, :datetime
    add_column :requests, :user_cancelada_id, :integer
    add_column :requests, :motivo_cancelamento, :text
  end
end
