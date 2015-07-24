class LocationsController < ApplicationController
  #autocomplete only on the title of the locations
  autocomplete :location, :title
  
  def index
  	#Takes the value inputted from search and filters @locations based on it
    #manipulates the @locations array to be filtered
    myString = Rails.application.config.myVar
    @locations = Location.where('title ILIKE ?', "%" + myString + "%").all
    
    
  end
  def search
    #takes a string from filter box and checks to see if any of the locations
    #have the exact name of a location. If so, the filter goes straight there.
    #Otherwise, the page redirects back to itself for a filtered index
    searchString = params[:location][:search]
    Rails.application.config.myVar = searchString
    @location = Location.find_by title:  searchString
    if @location.nil?
      
      redirect_to locations_path
    else
      redirect_to @location
    end
  end
  def reset
    #Used to reset the global filter string var
    Rails.application.config.myVar = ''
    redirect_to locations_path
  end
  def show
  	@location = Location.find(params[:id])
  end
  def new
  	if (!user_signed_in?) 
      redirect_to new_user_session_path
    else
      @location = Location.new
    end
  end
  def edit
  	if (!user_signed_in?) 
      redirect_to new_user_session_path
    else
      @location = Location.find(params[:id])
    end
  end
  def create
  	@location = Location.new(location_params)
    #String clean up for phone numbers
    phoneString = params[:location][:phone1]
    @location.phone1 = phoneString.gsub(/[^0-9]/, '')

    #Looks for a file upload, and it saves in the 
    #public folder if there is one
    uploaded_io = params[:location][:file]
    if (!uploaded_io.nil?)
            File.open(Rails.root.join('public', uploaded_io.original_filename), 'wb') do |file|
              file.write(uploaded_io.read)
        end
    end
    if @location.save
  	redirect_to @location
  	else
  		render 'new'
    end
  end
  def update
      @location = Location.find(params[:id])
 
      if @location.update(location_params)
        redirect_to @location
      else
        render 'edit'
      end
  end
  def destroy
  	if (!user_signed_in?) 
      redirect_to new_user_session_path
    else
      @location = Location.find(params[:id])
  	  @location.destroy
 
  	  redirect_to locations_path
    end
  end
   private
  	def location_params
  		params.require(:location).permit(:title, :picture, :address, :phone1, :person1, :type, :zip, :city, :state)
  	end
end
