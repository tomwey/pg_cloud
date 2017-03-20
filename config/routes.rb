Rails.application.routes.draw do
  
  # 商家会员登录
  get '/account/more_profile' => 'members#more_profile', as: :more_profile
  get '/account/studio' => 'members#studio', as: :new_studio
  get '/account/company' => 'members#company', as: :new_company
  
  resources :studios, only: [:create]
  resources :companies, only: [:create]
  
  # root 'home#index'
  
  # 商家后台
  namespace :portal, path: '' do
    root 'home#index'
    resources :products
    resources :members, path: 'staffs'
    resources :roles, except: :show
  end
  
  mount RedactorRails::Engine => '/redactor_rails'
  
  # 网页文档
  resources :pages, path: :p, only: [:show]
  
  # 后台系统登录
  devise_for :admins, ActiveAdmin::Devise.config
  # 后台系统路由
  ActiveAdmin.routes(self)
  
  devise_for :members, path: "account", controllers: {
    registrations: :account,
    sessions: :sessions,
  }
  
  # 队列后台管理
  require 'sidekiq/web'
  # require 'sidekiq/cron/web'
  authenticate :admin do
    mount Sidekiq::Web => 'sidekiq'
  end
  
  # API 文档
  mount GrapeSwaggerRails::Engine => '/apidoc'
  
  # API 路由
  mount API::Dispatch => '/api'
end
