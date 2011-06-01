module RiotOnRails
  class DatabaseCleanerMiddleware < Riot::ContextMiddleware
    register

    def call(context)
      setup_database_cleaner(context) if clean_database?(context)
      middleware.call(context)
    end

    private
    def root_context?(context)
      context.parent.kind_of? Riot::RootContext
    end

    def clean_database?(context)
      RiotOnRails.using_database_cleaner? &&
        (not context.option(:skip_database_cleaner)) &&
        root_context?(context)
    end

    def setup_database_cleaner(context)
      context.setup(true) { DatabaseCleaner.start }
      context.teardown { DatabaseCleaner.clean }
    end
  end
end