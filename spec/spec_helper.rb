require 'simplecov'
SimpleCov.start do
  add_filter '/spec'
end

require 'rspec'
require 'id'
require 'daodalus'
require 'id_daodalus'

RSpec.configure do |config|
  config.order = :rand
  config.color_enabled = true
end

Daodalus::Configuration.load('spec/support/daodalus.yml', :test)
