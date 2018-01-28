class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :title
      t.string :url
      t.string :css_selector

      t.timestamps
    end
  end
end
