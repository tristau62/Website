class LocationsController < ApplicationController
  def index
  	@locations = Location.all
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
      
   
    if @location.save
  	redirect_to @location
  	else
  		render 'new'
    end
  end
  #def upload
    #uploaded_io = params[:location][:ourFile]
   
    #File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    #  file.write(uploaded_io.read)
    #end
 # end
  def upload
     uploaded_io = params[:file]
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.original_filename) 
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
  		params.require(:location).permit(:title, :picture, :address, :phone, :person1, :type)
  	end
end
