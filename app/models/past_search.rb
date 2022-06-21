class PastSearch < ApplicationRecord
  validates :providers, presence: true
  validates :query, presence: true
end
