class Subcat < ActiveRecord::Base
  has_many :places
  belongs_to :cat
end
