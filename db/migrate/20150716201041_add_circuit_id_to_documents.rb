class AddCircuitIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :circuit_id, :integer
  end
end
