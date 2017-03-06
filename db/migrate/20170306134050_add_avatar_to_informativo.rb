class AddAvatarToInformativo < ActiveRecord::Migration
  def change
    add_column :informativos, :avatar, :string
  end
end
