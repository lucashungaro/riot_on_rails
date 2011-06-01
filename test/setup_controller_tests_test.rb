require "teststrap"

context "settung up riot for controller testing" do
  setup { Riot::Situation.new }

  asserts("defines the app method as the Rails application") { topic.app == Rails.application }

  asserts("includes the Rack::Test api") { topic.class.ancestors.include? Rack::Test::Methods }
end