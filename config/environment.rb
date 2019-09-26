require 'sinatra'
require 'yaml'
require 'active_record'
require 'sinatra/activerecord'
require 'bundler/setup'
Bundler.require

ENV['SINATRA_ENV'] ||= "development"
APP_ROOT = File.expand_path("..", __dir__)
Dir.glob(File.join(APP_ROOT, 'app', 'models', '*.rb')).each { |file| require file }
DB_CONFIG = YAML::load(File.open('config/database.yml'))

configure :development do
  ActiveRecord::Base.establish_connection(
    adapter: 'mysql2',
    username: DB_CONFIG['username'],
    password: DB_CONFIG['password'],
    host: DB_CONFIG['host'],
    database: DB_CONFIG['database']
  )
end
