class Place < ActiveRecord::Base
  belongs_to :subcat
  belongs_to :cat, through: :subcat
end
