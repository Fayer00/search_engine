require "rails_helper"

describe PastSearch, type: :model do

  describe "valid object" do
    subject {
      create(:past_search)
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a providers" do
      subject.providers = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a query" do
      subject.query = nil
      expect(subject).to_not be_valid
    end
  end
end