class AddPaperclipToCircuit < ActiveRecord::Migration
  add_attachment :circuits, :document
  def change
  end
end
