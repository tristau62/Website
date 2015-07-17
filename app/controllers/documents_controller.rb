class DocumentsController < ApplicationController
	def show 
		@document = Document.find(params[:id]) 
	end
	def create
		@circuit = Circuit.find(params[:circuit_id])
		@document = @circuit.documents.create()
		
		uploaded_io = params[:document][:file]
		if (!uploaded_io.nil?)
            File.open(Rails.root.join('public', uploaded_io.original_filename), 'wb') do |file|
              file.write(uploaded_io.read)
        	end
    	end
		redirect_to circuit_path(@circuit)
	end
end
