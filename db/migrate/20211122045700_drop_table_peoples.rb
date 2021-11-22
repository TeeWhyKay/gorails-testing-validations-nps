class DropTablePeoples < ActiveRecord::Migration[6.0]
  def change
    drop_table :peoples
  end
end
