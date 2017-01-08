ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

  ActiveRecord::Base.establish_connection(
    :adapter => 'mysql2',
    :database => 'chopsticks',
    :host => 'localhost',
    :username => 'davinci',
    :password => 'files'
  )


require_all 'app'