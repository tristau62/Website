class CreateCircuits < ActiveRecord::Migration
  def change
    create_table :circuits do |t|
      t.string :carrier
      t.string :class1
      t.string :contract
      t.string :purpose
      t.string :expiration

      t.timestamps
    end
  end
end
