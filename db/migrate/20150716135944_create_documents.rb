class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|

    	t. references :circuit, index: true
      t.timestamps null: false
    end
    add_foreign_key :documents, :circuits
  end
end
