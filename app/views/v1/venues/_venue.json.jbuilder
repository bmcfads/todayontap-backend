json.type venue.class
json.id venue.id
json.extract! venue,
              :category,
              :name,
              :description
json.address do
  json.extract! venue,
                :street,
                :city,
                :province,
                :postal_code
end
json.extract! venue,
              :slug,
              :website_url,
              :thumbnail_url,
              :banner_url,
              :google_maps_embed_url
json.links do
  json.venue_url v1_venue_url(venue.slug)
  json.events_url v1_venue_events_url(venue.slug)
end
json.extract! venue,
              :created_at,
              :updated_at
