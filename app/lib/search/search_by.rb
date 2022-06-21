module Search
  class SearchBy
    def search(query)
      errors = search_log(query)
      puts errors.inspect
      return { status: "FAIL" } if errors.errors.any?
      google = @providers.include?('google') ? search_by_google(query) : nil
      bing = @providers.include?('bing') ? search_by_bing(query) : nil

      { status: "SUCCESS", google: ,bing: }.compact
    end

    private

    attr_reader :providers


    # @param [String] providers
    def initialize(providers:)
      @providers = providers
    end

    def search_by_google(query)
      GoogleSearch.api_key = ENV['API_KEY']
      search = GoogleSearch.new(q: query)
      result = search.get_hash
      return result[:organic_results] unless result.empty?

      []
    end

    def search_by_bing(query)
      BingSearch.api_key = ENV['API_KEY']
      search = BingSearch.new(q: query)
      result = search.get_hash
      return result[:organic_results] unless result.empty?

      []
    end

    def search_log(query)
      log = PastSearch.create(providers: @providers, query:)
      return log if log.errors
    end
  end
end
