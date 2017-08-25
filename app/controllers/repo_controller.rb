class RepoController < ApplicationController

  def create
    if GithubService.create_repo(current_user, params[:repo_name])
      flash[:success] = "Repo created"
      redirect_to dashboard_path
    else
      flash[:error] = "Error"
      redirect_to dashboard_path
    end
  end
end
