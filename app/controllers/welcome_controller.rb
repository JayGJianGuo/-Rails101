class WelcomeController < ApplicationController
  def index
    flash[:notice] = "success"
  end
end
