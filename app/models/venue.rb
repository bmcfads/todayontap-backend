class Venue < ApplicationRecord
  has_many :events, dependent: :destroy

  validates :description, length: { maximum: 200 }

  def self.get_venues_in_category(category)
    case category
    when 'brewery'
      Venue.where('category = ?', 'brewery').order('name')
    end
  end
end
