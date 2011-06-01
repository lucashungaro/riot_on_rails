module RiotOnRails
  class << self
    def database_cleaner=(value)
      @using_database_cleaner = value
    end

    def using_database_cleaner?
      @using_database_cleaner
    end
  end
end

RiotOnRails.database_cleaner = true