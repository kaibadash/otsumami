class AddUserIdToSites < ActiveRecord::Migration[5.1]
  def up
    add_column :sites, :user_id, :int, foreign_key: true, null: false, after: :css_selector
  end

  def down
    remove_column :sites, :user_id
  end
end
