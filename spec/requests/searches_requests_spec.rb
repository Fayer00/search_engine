require "rails_helper"

RSpec.describe SearchesController, type: :request do
  subject { response }

  describe "GET /search" do
    let(:params) do
      {
        providers: ['google'],
        query: 'coquimbo'
      }
    end

    before do
      GoogleSearch.api_key = ENV['API_KEY']
      get "/search", params: params
    end

    it { expect(response).to have_http_status(:ok) }

    it { expect(JSON.parse(response.body)).to have_key("google") }

    it { expect(JSON.parse(response.body)).to_not have_key("bing") }

  end
end