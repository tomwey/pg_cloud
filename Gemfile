source 'https://ruby.taobao.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'

gem 'sprockets'
gem 'sass-rails'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use postgresql as the database for Active Record
gem 'pg'

# Postgis 2.0+
# gem 'rgeo'

# 防止大量请求的IP
gem 'rack-attack'

# 支持解析xml

# postgresql search
# gem 'pg_search'

# 生成二维码
# gem 'rqrcode_png'

# redis
gem 'redis'
gem 'hiredis'
# redis 命名空间
gem 'redis-namespace'
# 将一些数据存放入 Redis
gem 'redis-objects'

# 队列处理消息发送
gem 'sidekiq'
# gem 'sinatra', :require => nil

# 周期执行任务
# gem "sidekiq-cron", "~> 0.4.0"
# gem 'whenever', :require => false
gem "sidekiq-cron"

# 后台管理系统
gem 'activeadmin', github: 'activeadmin'
# gem 'activeadmin', github: 'gregbell/active_admin', branch: '0-6-stable'

# 上传组件
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'mini_magick'#,'~> 4.2.7'#, require: false
# 解决大文件上传报内存问题：Cannot allocate memory - identify
gem 'posix-spawn'

# gem 'mqtt', github: 'njh/ruby-mqtt'
gem 'carrierwave-qiniu', '0.2.3'

# Bootstrap UI
gem 'bootstrap-sass', '~> 3.2.0'

# 分页
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'bootstrap_helper', '4.2.3'

# 用户系统
gem 'devise'

# gem "cancan"
gem 'cancancan'#, '~> 1.10'

# YAML 配置信息
gem 'settingslogic'

# 消息推送
gem 'jpush'

# API
gem 'grape'
gem 'grape-entity'
gem 'newrelic-grape'
# for api 跨域访问
gem 'rack-cors', require: 'rack/cors'
gem 'rack-utf8_sanitizer'

# 富文本编辑器
gem 'redactor-rails'

# API doc
gem 'grape-swagger'
gem 'grape-swagger-rails'

# gem 'state_machine'

# rest请求
gem 'rest-client'

# Use unicorn as the app server
gem 'unicorn'
gem 'unicorn-worker-killer'

# memcached
gem 'dalli'

# 状态机
gem 'state_machine'

# puma
#gem 'puma'

# Use Capistrano for deployment
group :development do
  
  # rails specific capistrano funcitons
  gem 'capistrano-rails', '~> 1.1.0'

  # integrate bundler with capistrano
  gem 'capistrano-bundler'

  # if you are using RBENV
  gem 'capistrano-rbenv', "~> 2.0" 
  
  # puma server
  # gem 'capistrano3-puma', require: false
  
  gem 'capistrano-sidekiq'
  
  gem 'quiet_assets'
  
  gem 'annotate', '~> 2.6.5'
  
  # Better Errors
  gem 'better_errors'
  gem 'binding_of_caller'
end


# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

