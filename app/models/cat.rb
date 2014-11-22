class Cat < ActiveRecord::Base
  has_many :subcats
  has_many :places, through: :subcats
end
