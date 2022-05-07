Rails.application.routes.draw do
  root to: redirect('v1/events/today')

  namespace :admin do
    resources :users
    post 'auth/login', to: 'authentication#login'
  end

  namespace :v1 do
    root to: redirect('v1/events/today')

    defaults format: :json do
      get 'events', to: 'events#timeframe', timeframe: 'all'
      get 'events/featured', to: 'events#timeframe', timeframe: 'featured'
      get 'events/today', to: 'events#timeframe', timeframe: 'today'
      get 'events/upcoming', to: 'events#timeframe', timeframe: 'upcoming'
      get 'events/past', to: 'events#timeframe', timeframe: 'past'
      get 'venues/breweries', to: 'venues#category', category: 'brewery'

      resources :venues, param: :slug do
        resources :events
      end
    end
  end
end
