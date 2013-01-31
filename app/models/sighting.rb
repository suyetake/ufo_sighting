class Sighting < ActiveRecord::Base
  attr_accessible :city, :duration, :match_score, :posted_at, :shape, :sighted_at, :state, :summary, :x_coord, :y_coord

  def latitude
    y_coord
  end

  def longitude
    x_coord
  end
end
