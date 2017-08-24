class RepoController < ApplicationController

  def create
    if User.create_repo(current_user, params[:repo_name])
      flash[:success] = "Repo created"
    else
      flash[:error] = "Error"
    end
  end
end
