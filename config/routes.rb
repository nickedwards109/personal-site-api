Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :sections do
        get "/", to: "sections#index"
      end
    end
  end
end
