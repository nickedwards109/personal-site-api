Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :projects do
        get "/", to: "projects#index"
      end
    end
  end
end
