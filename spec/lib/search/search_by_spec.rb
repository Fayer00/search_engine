require "rails_helper"

describe Search::SearchBy do
  let!(:new_search) { Search::SearchBy.new(providers: params[:providers]) }

  context "when invalid query" do
    describe "search_log method" do
      subject(:result) { new_search.search(params[:query]) }
      context "when valid" do
        let(:params) do
          {
            providers: ['google'],
            query: 'Antofagasta'
          }
        end
        it "fails" do
          expect(result[:status]).to eq 'SUCCESS'
        end
      end

      context "when invalid query" do
        let(:params) do
          {
            providers: ['google'],
            query: ''
          }
        end
        it "fails" do
          puts "asdf"
          puts result.inspect
          expect(result[:status]).to eq "FAILED"
        end
      end

      context "when invalid providers" do
        let(:params) do
          {
            providers: '',
            query: 's'
          }
        end
        it "fails" do
          expect(result[:status]).to eq "FAILED"
        end
      end
    end
  end
end
