json.type event.class
json.id event.id
json.extract! event,
              :featured,
              :category,
              :name,
              :description,
              :datetime,
              :website_url,
              :thumbnail_url,
              :banner_url
json.venue do
  json.id event.venue.id
  json.name event.venue.name
  json.slug event.venue.slug
end
json.links do
  json.event_url v1_venue_event_url(event.venue.slug, event.id)
  json.venue_url v1_venue_url(event.venue.slug)
end
json.extract! event,
              :created_at,
              :updated_at
