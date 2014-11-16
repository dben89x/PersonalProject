class Spot <ActiveRecord::Base
  validates :location, presence: true
  validates :time, presence: true
  validates :others, presence: true
  validates :description, presence: true

end
