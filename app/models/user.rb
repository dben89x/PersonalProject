class User < ActiveRecord::Base
  def full_name
    "#{first_name} #{last_name}"
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  belongs_to :comment
  belongs_to :subscription

  has_many :spots
  has_many :comments
  has_many :subscriptions
  has_secure_password
end
