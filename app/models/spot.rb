class Spot <ActiveRecord::Base
  validates :location, presence: true
  validates :start_time, presence: true
  validates :others, presence: true
  validates :description, presence: true

end
