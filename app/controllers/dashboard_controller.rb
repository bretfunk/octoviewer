class DashboardController < ApplicationController

  def show
    @presenter = DashboardPresenter.new(current_user)
  end
end


