class SubscriptionsController < ApplicationController
  def new
    @user = User.find(current_user.id)
    @subscription = @user.subscriptions.new
  end
  def index
    @wikis = Wiki.all.member
  end
  def create
    @user = User.find(current_user.id)
    @subscription = @user.subscriptions.build(user_id: @user.id)
    if @subscription.save_with_payment
      redirect_to root_path , :notice => "Thank you for subscribing!"
    else
      render :new
    end
  end
  def show
    @subscription = Subscription.find(params[:id])
  end

  private
  
  def subscription_params
    
  end
end