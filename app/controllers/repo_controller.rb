class RepoController < ApplicationController

  def create
    if GithubService.create_repo(current_user, params[:repo_name])
      flash[:notice] = "Repo created"
      redirect_to dashboard_path
    else
      flash[:notice] = "Error creating repo"
      redirect_to dashboard_path
    end
  end
end
