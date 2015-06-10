class AddPhone1ToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :phone1, :string
  end
end
