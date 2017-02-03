class AddAvatarToArquivo < ActiveRecord::Migration
  def change
    add_column :arquivos, :avatar, :string
  end
end
