Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :pages do
        get "/", to: "pages#index"
      end
    end
  end
end
