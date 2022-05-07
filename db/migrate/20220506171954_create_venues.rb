class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.boolean :featured
      t.string :category
      t.string :name
      t.text :description
      t.string :street
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :slug
      t.string :website_url
      t.text :thumbnail_url
      t.text :banner_url
      t.text :google_maps_embed_url

      t.timestamps
    end
    add_index :venues, :slug, unique: true
  end
end
