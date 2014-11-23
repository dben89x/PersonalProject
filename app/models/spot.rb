class Spot <ActiveRecord::Base
  validates :location, presence: true
  validates :start_time, presence: true
  validates :user_id, presence: true
  validates :description, presence: true

  belongs_to :place
  belongs_to :user
  
  has_many :comments
end
