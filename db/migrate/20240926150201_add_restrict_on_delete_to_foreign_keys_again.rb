class AddRestrictOnDeleteToForeignKeysAgain < ActiveRecord::Migration[7.1]
  def change
    # Remove existing foreign keys if any
    remove_foreign_key :bookmarks, :lists if foreign_key_exists?(:bookmarks, :lists)
    remove_foreign_key :bookmarks, :movies if foreign_key_exists?(:bookmarks, :movies)

    # Add foreign keys with restrict on delete
    add_foreign_key :bookmarks, :lists, on_delete: :restrict
    add_foreign_key :bookmarks, :movies, on_delete: :restrict
  end
end
