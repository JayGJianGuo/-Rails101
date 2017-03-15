class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Successfully created..."
  end
end
