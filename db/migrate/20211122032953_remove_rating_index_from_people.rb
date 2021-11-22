class RemoveRatingIndexFromPeople < ActiveRecord::Migration[6.0]
  def change
    remove_index :people, :rating_id
  end
end
