class WelcomeController < ApplicationController
  def index
    flash[:notice] = "😑"
  end
end
