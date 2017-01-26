class AddAttachmentAvatarToArquivos < ActiveRecord::Migration
  def self.up
    change_table :arquivos do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :arquivos, :avatar
  end
end
