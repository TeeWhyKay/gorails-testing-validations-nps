class RemovePersonRefOnRatingsTable < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :ratings, column: :person_id

  end
end
