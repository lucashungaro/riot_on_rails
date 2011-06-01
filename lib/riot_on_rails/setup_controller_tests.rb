module RiotOnRails
  class Riot::Situation
    include Rack::Test::Methods

    def app
      Rails.application
    end
  end
end