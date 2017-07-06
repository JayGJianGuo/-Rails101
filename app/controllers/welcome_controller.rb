class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Hello!"
    flash[:alert] = "Hello!"
    flash[:warning] = "Hello!"
  end
end
