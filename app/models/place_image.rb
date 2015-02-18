class PlaceImage < ActiveRecord::Base
  belongs_to :place
  belongs_to :user
  belongs_to :spot
end
