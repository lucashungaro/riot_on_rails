require "teststrap"

context RiotOnRails::DatabaseCleanerMiddleware do
  context "when configured to clean the database" do
    setup do
      Riot::Context.new("test context root") { Riot::Context.new("test context child") { } }
    end

    should("start and rollback the transaction for the root context") do
      mock(DatabaseCleaner).start.once
      mock(DatabaseCleaner).clean.once
      topic.local_run(Riot::SilentReporter.new, Riot::Situation.new)
    end
  end

  context "when configured to skip database_cleaner" do
    setup do
      RiotOnRails.database_cleaner = false
      Riot::Context.new("test context root") { Riot::Context.new("test context child") { } }
    end

    should("start and rollback the transaction for the root context") do
      mock(DatabaseCleaner).start.never
      mock(DatabaseCleaner).clean.never
      topic.local_run(Riot::SilentReporter.new, Riot::Situation.new)
    end
  end

  context "when the context doesn't uses database_cleaner" do
    setup do
      Riot::Context.new("test context root") { set :skip_database_cleaner, true }
    end

    should("start and rollback the transaction for the root context") do
      mock(DatabaseCleaner).start.never
      mock(DatabaseCleaner).clean.never
      topic.local_run(Riot::SilentReporter.new, Riot::Situation.new)
    end
  end
end