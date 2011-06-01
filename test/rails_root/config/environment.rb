ENV['RAILS_ENV'] = 'test'

require 'sqlite3'
require "active_record/railtie"

module RiotOnRails
  class Application < Rails::Application
    config.root = File.expand_path(File.join(File.dirname(__FILE__), ".."))

    config.session_store :cookie_store, {:key => "_riotonrails_session"}
    config.secret_token = "i own you." * 3
  end
end

RiotOnRails::Application.initialize!

#require File.join(Rails.root, "config", "routes.rb")

# Logging stuff

class NilIO
  def write(*args); end
  def close(*args); end
  def puts(*args); end
  def path; nil; end
  def fsync; 0; end
  def to_s; "hello"; end
  def sync; true; end
  def sync=(arg); arg; end
end

def shhh(&block)
  orig_out = $stdout
  $stdout = NilIO.new
  yield
  $stdout = orig_out
end

shhh do
  load(File.join(Rails.root, "db", "schema.rb"))
end

ActiveRecord::Base.logger = Logger.new(NilIO.new)
