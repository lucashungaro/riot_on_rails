$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require "riot"
require "riot_on_rails"
require "riot/rr"

require(Pathname(__FILE__).dirname + 'rails_root' + 'config' + 'environment')

class NullObject
  def method_missing(*args, &block)
    self
  end

  def nil?; true; end
end