class RemoveRatingIdFromPeople < ActiveRecord::Migration[6.0]
  def change
    remove_column :people, :rating_id
  end
end
