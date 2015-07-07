class LocationsController < ApplicationController
  autocomplete :location, :title
  
  def index
  	myString = Rails.application.config.myVar
    #locations = Location.all
    
    @locations = Location.where('title ILIKE ?', "%" + myString + "%").all
    
    
  end
  def search
    searchString = params[:location][:search]
    Rails.application.config.myVar = searchString
    #redirect_to locations_path
    @location = Location.find_by title:  searchString
    if @location.nil?
      
      redirect_to locations_path
    else
      redirect_to @location
    end
  end
  def reset
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
    
    phoneString = params[:location][:phone1]
    @location.phone1 = phoneString.gsub(/[^0-9]/, '')


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
