class CreateScrapedResults < ActiveRecord::Migration[5.1]
  def change
    create_table :scraped_results do |t|
      t.references :site, index: true
      t.string :text, unique: true

      t.timestamps
    end
  end
end
