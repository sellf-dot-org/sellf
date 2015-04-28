class SellController < ApplicationController
  def welcome
    @user = current_user if current_user
  end
end
