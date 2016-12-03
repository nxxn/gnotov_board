Rails.application.routes.draw do

  scope "(:locale)", locale: /lv|ru|en/ do
    devise_for :users, controllers: {
          registrations: 'users/registrations'
        }

    root 'home#index'

    get 'contacts', to: 'home#contacts'

    post '/new_contact_message', to: 'messages#send_new_contact_form_message'

    post '/new_ad_issue', to: 'ads#ad_issue'

    resources :ads do
      put :favorite, on: :member

      collection do
        get :my_ads
      end
    end

    get 'stop_ad', to: 'ads#stop_ad'
    get 'start_ad', to: 'ads#start_ad'

    post 'uploadfiles', to: 'ads#upload'

    patch 'uploadfiles', to: 'ads#upload'

    get 'get_subcategories', to: 'ads#get_subcategories', defaults: { format: "js" }

    get 'show_dealer', to: 'dealers#show'

  end

  namespace :admin do
    root 'home#index'

    resources :ads
    resources :users
    resources :messages
    resources :car_makes

    get 'stop_ad', to: 'ads#stop_ad'
    get 'was_paid', to: 'ads#was_paid'

    get 'stop_user', to: 'users#stop_user'

    post '/new_car_make', to: 'car_makes#new_car_make'
    post '/new_car_model', to: 'car_makes#new_car_model'
  end
end
