Rails.application.routes.draw do
  root "dashboard#index"
  resources :admins
  resources :ads
  resources :ad_views
  resources :animals
  resources :avatars
  resources :breeds
  resources :chats
  resources :dislikes
  resources :likes
  resources :messages
  resources :user_notifications
  resources :quota
  resources :user_reports
  resources :subscriptions
  resources :tiers
  resources :transactions
  resources :types
  resources :users

  namespace :api do
    namespace :v1 do
      resources :registrations, only: %i[create update] do
        collection do
          put 'verify_otp'
          put 'resend_otp'
          put 'create_profile'
        end
      end
      resources :sessions, only: %i[create destroy]
      resources :users, only: %i[show update destory]do
        collection do
          get 'show_other'
        end
      end
      resources :animals, except: %i[index edit] do
        collection do
          put 'edit_avatar'
        end
      end
      resources :recommendations, only: %i[index]
      resources :likes, only: %i[create]
      resources :dislikes, only: %i[create]
      resources :user_notifications, only: %i[index]
      resources :chats, only: %i[index show update] do
        collection do
          get 'blocked_users'
        end
      end
      resources :messages, only: %i[index create] #index for unread messages
      resources :subscriptions, only: %i[show]
      resources :user_reports, only: %i[create]
      resources :tiers, only: %i[index]
      resources :transactions, only: %i[create]
      resources :paymob_transactions, only: %i[create]
      resources :ads, only: %i[index update]
      resources :ads, only: %i[index]
    end
  end
end
