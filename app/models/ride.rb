class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    not_ok = can_ride
    return "Sorry. #{not_ok.join('. ')}." if !not_ok.empty?
    self.user.update(
      tickets: self.user.tickets - self.attraction.tickets,
      happiness: self.user.happiness + self.attraction.happiness_rating,
      nausea: self.user.nausea + self.attraction.nausea_rating
      )
    false
  end

  private

  def can_ride
    ans = []
    if self.user.tickets < self.attraction.tickets
      ans << "You do not have enough tickets to ride the #{attraction.name}"
    end
    if self.user.height < self.attraction.min_height
      ans << "You are not tall enough to ride the #{attraction.name}"
    end
    ans
  end

end
