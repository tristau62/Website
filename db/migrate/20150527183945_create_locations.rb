class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :title
      t.string :picture
      t.string :address
      t.integer :phone
      t.string :person1
      t.string :person2
      t.string :type
      t.string :equipment

      t.timestamps
    end
  end
end
