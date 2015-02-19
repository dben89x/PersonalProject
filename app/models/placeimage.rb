class Placeimage < ActiveRecord::Base
  belongs_to :place
  belongs_to :user
  belongs_to :spot

  mount_uploader :image, PlaceimageUploader
end
