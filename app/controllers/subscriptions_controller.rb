class SubscriptionsController<ApplicationController
  def create
    Subscription.create(
      user_id: current_user.id,
      place_id: params[:place_id],
      role: 'Subscriber'
    )
    redirect_to place_path(params[:place_id])
  end
end
