class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.boolean :featured
      t.string :category
      t.string :name
      t.text :description
      t.datetime :datetime
      t.string :website_url
      t.text :thumbnail_url
      t.text :banner_url
      t.belongs_to :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
