class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid, null: false, index: true
      t.string :name, null: false
      t.string :image, null: false, default: ""

      t.timestamps
    end
  end
end
