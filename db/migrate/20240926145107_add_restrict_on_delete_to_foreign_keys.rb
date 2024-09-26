class AddRestrictOnDeleteToForeignKeys < ActiveRecord::Migration[7.1]
  def change
    # Remove existing foreign keys
    remove_foreign_key :bookmarks, :lists
    remove_foreign_key :bookmarks, :movies

    # Add foreign keys with restrict on delete
    add_foreign_key :bookmarks, :lists, on_delete: :restrict
    add_foreign_key :bookmarks, :movies, on_delete: :restrict
  end
end
