class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :navs
  before_action :ensure_logged_in

  def current_user
    User.find_by(id: session[:user_id])
  end

  def ensure_logged_in
    unless current_user
      redirect_to signin_path, notice: 'You must be logged in to see this page'
    end
  end

  def navs
    @spot_nav = Spot.new
    @attendee_nav = Attendee.new
  end

  def my_friends
    friends = []
    User.all.each do |user|
      user.friends.each do |friend|
        if friend.friend_id == current_user.id
          friends << user
        end
      end
    end
    friends
  end

  def friendly_spots
    spots = []
    my_friends.each do |user|
      user.spots.each do |spot|
        spots << spot
      end
    end
    spots
  end


  def subbed_places
    places = []
    Subscription.where(user_id: current_user.id).each { |subs| places << subs.place}
    places
  end

  helper_method :ensure_logged_in
  helper_method :current_user
  helper_method :subbed_places
  helper_method :my_friends
  helper_method :friendly_spots

end
