class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :owner
      t.text :body
      t.references :location, index: true

      t.timestamps
    end
  end
end
