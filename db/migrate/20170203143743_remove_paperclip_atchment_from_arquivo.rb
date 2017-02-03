class RemovePaperclipAtchmentFromArquivo < ActiveRecord::Migration
  def change
  	remove_attachment :arquivos, :avatar
  end
end
