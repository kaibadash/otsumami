class CreateScrapedResults < ActiveRecord::Migration[5.1]
  def change
    create_table :scraped_results do |t|
      t.references :site, index: true, null: false
      t.string :text, unique: true, null: false, default: ""

      t.timestamps
    end
  end
end
