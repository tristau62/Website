class NotesController < ApplicationController
	def create
		@location = Location.find(params[:location_id])
		@note = @location.notes.create(note_params)
		
		redirect_to location_path(@location)
	end

	def destroy
		@location = Location.find(params[:location_id])
		@note = @location.notes.find(params[:id])
		@note.destroy
		redirect_to location_path(@location)
	end
	private
		def note_params
			params.require(:note).permit(:owner, :body)
		end
end
