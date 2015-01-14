class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :spot_nav
  def spot_nav
    @spot_nav = Spot.new
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def subbed_places
    places = []
    Subscription.where(user_id: current_user.id).each { |subs| places << subs.place}
    places
  end

  helper_method :current_user
  helper_method :subbed_places

end
