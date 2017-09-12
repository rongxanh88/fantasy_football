Rails.application.routes.draw do
  get 'api/v1/quarterbacks', to: 'api/v1/quarterbacks#index'
  get 'api/v1/runningbacks', to: 'api/v1/runningbacks#index'
  get 'api/v1/receivers', to: 'api/v1/receivers#index'
  get 'api/v1/tightends', to: 'api/v1/tightends#index'
  get 'api/v1/defenses', to: 'api/v1/defenses#index'

  post 'api/v1/salaries', to: 'api/v1/salaries#index'
end
