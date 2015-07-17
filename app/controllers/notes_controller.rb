class NotesController < ApplicationController
	def create
		@location = Location.find(params[:location_id])
		@note = @location.notes.create(note_params)
		
		uploaded_io = params[:note][:file]
    	if (!uploaded_io.nil?)
            File.open(Rails.root.join('public', uploaded_io.original_filename), 'wb') do |file|
              file.write(uploaded_io.read)
        end
    end
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
