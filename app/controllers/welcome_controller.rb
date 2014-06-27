class WelcomeController < ApplicationController
  def index
    @wikis = current_user.wikis if current_user
  end

  def about
  end
end
