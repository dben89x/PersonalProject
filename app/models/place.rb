class Place < ActiveRecord::Base
  belongs_to :subcat

  has_many :spots
  has_many :comments
  has_many :subscriptions
  has_many :users, through: :subscriptions
end
