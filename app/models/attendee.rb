class Attendee < ActiveRecord::Base
  belongs_to :spot
  belongs_to :user
end
