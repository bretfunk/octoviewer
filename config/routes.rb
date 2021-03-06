Rails.application.routes.draw do
  root "home#index"
  get "/auth/github", as: "github_login"
  get "/auth/github/callback", to: "sessions#create"
  get "/logout", to: "sessions#destory"
  get "/dashboard", to: "dashboard#show"
  post "/repo", to: "repo#create"
end
