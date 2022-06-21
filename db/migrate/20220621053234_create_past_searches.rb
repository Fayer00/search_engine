class CreatePastSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :past_searches do |t|
      t.string :providers
      t.string :query

      t.timestamps
    end
  end
end
