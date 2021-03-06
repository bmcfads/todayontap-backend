class Event < ApplicationRecord
  belongs_to :venue

  validates :name, length: { maximum: 35 }
  validates :description, length: { maximum: 200 }

  def self.get_events_in_timeframe(timeframe, offset)
    today_start = (Time.current - offset.to_i).beginning_of_day + offset.to_i
    tomorrow_start = today_start.next_day

    case timeframe
    when 'all'
      Event.all
    when 'featured'
      Event.where('featured = ?', true).and(Event.where('datetime >= ?', today_start)).shuffle
    when 'today'
      Event.where('datetime >= ?', today_start).and(Event.where('datetime < ?', tomorrow_start)).order('datetime')
    when 'upcoming'
      Event.where('datetime >= ?', tomorrow_start).order('datetime')
    when 'past'
      Event.where('datetime < ?', today_start).order('datetime DESC')
    end
  end
end
