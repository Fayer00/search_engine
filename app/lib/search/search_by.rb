module Search
  class SearchBy
    def search(query)
      #cast params as string and search
      google = @providers.include?('google') ? search_by_google(query) : nil
      bing = @providers.include?('bing') ? search_by_bing(query) : nil

      { status: "SUCCESS", google: ,bing: }.compact
    end

    private

    attr_reader :providers


    def initialize(providers:)
      @providers = providers
    end

    def search_by_google(params)
      GoogleSearch.api_key = ENV['API_KEY']
      search = GoogleSearch.new(q: params)
      result = search.get_hash
      return result[:organic_results] unless result.empty?

      []
    end

    def search_by_bing(params)
      BingSearch.api_key = ENV['API_KEY']
      search = BingSearch.new(q: params)
      result = search.get_hash
      return result[:organic_results] unless result.empty?

      []
    end
  end
end
