
# frozen_string_literal: true

# MetricsController simple CRUD
class SearchesController < ApplicationController
  def index
    @title = "Search Engine"
    @past_results = PastSearch.last(10).pluck(:providers, :query)
  end

  def search
    new_search = Search::SearchBy.new(providers: params[:providers])
    search_result = new_search.search(params[:query])
    render json: search_result.to_json, status: :ok
  end

end
