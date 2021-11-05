class ChangePeopleToPeoples < ActiveRecord::Migration[6.0]
  def change
    rename_table :people, :peoples
  end
end
