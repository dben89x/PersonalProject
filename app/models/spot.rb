class Spot <ActiveRecord::Base
  after_initialize do
    if self.new_record?
      self.start_time = Time.now
      self.end_time = Time.now + 2.hours
      self.date = Time.now.to_date
    end
  end

  validates :start_time, presence: true
  validates :description, presence: true
  validates :place, presence: true

  belongs_to :place

  has_many :comments
  has_many :attendees
  has_many :users, through: :attendees
end
