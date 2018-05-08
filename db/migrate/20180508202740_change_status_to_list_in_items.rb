class ChangeStatusToListInItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :status, :list
  end
end
