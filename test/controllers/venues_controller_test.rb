require "test_helper"

class VenuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @venue = venues(:one)
  end

  test "should get index" do
    get venues_url, as: :json
    assert_response :success
  end

  test "should create venue" do
    assert_difference("Venue.count") do
      post venues_url, params: { venue: { banner_url: @venue.banner_url, category: @venue.category, city: @venue.city, description: @venue.description, featured: @venue.featured, google_maps_embed_url: @venue.google_maps_embed_url, name: @venue.name, postal_code: @venue.postal_code, province: @venue.province, slug: @venue.slug, street: @venue.street, thumbnail_url: @venue.thumbnail_url, website_url: @venue.website_url } }, as: :json
    end

    assert_response :created
  end

  test "should show venue" do
    get venue_url(@venue), as: :json
    assert_response :success
  end

  test "should update venue" do
    patch venue_url(@venue), params: { venue: { banner_url: @venue.banner_url, category: @venue.category, city: @venue.city, description: @venue.description, featured: @venue.featured, google_maps_embed_url: @venue.google_maps_embed_url, name: @venue.name, postal_code: @venue.postal_code, province: @venue.province, slug: @venue.slug, street: @venue.street, thumbnail_url: @venue.thumbnail_url, website_url: @venue.website_url } }, as: :json
    assert_response :success
  end

  test "should destroy venue" do
    assert_difference("Venue.count", -1) do
      delete venue_url(@venue), as: :json
    end

    assert_response :no_content
  end
end
