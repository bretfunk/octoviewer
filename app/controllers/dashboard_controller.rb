class DashboardController < ApplicationController

  def show
    @profile = Profile.new(current_user)
    @presenter = DashboardPresenter.new(current_user)
  end
end


