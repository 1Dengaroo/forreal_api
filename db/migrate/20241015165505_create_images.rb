class CreateImages < ActiveRecord::Migration[7.2]
  def change
    create_table :images do |t|
      t.references :property, null: false, foreign_key: true
      t.string :image_url
      t.integer :position

      t.timestamps
    end
  end
end
