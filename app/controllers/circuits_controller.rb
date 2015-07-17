class CircuitsController < ApplicationController
	autocomplete :circuit, :carrier
  def index
		#@circuits = Circuit.all
    myString = Rails.application.config.myVar
    @circuits = Circuit.where('carrier ILIKE ?', "%" + myString + "%").all
	end
	def search
    searchString = params[:circuit][:search]
    Rails.application.config.myVar = searchString
    #redirect_to circuits_path
    @circuit = Circuit.find_by carrier:  searchString
    if @circuit.nil?
      
      redirect_to circuits_path
    else
      redirect_to @circuit
    end
  end
  def reset
    Rails.application.config.myVar = ''
    redirect_to circuits_path
  end
  def show
  		@circuit = Circuit.find(params[:id])
  	end
  def new
  		@circuit = Circuit.new
  end
  def edit 
  	if(!user_signed_in)
  		redirect_to new_user_session_path
    else
      	@circuit = Circuit.find(params[:id])
    end
  end
  def create
    @circuit = Circuit.new(circuit_params)
    if @circuit.save
    	redirect_to @circuit
    else 
  		render 'new'
    end
  end
  def update
    @circuit = Circuit.find(param[:id])

    if @circuit.update(circuit_params)
    	redirect_to @circuit
    else
    	render 'edit'
    end
  end
  def destroy
    if(!user_signed_in?)
    	redirect_to new_user_session_path
    else
      	@circuit = Circuit.find(params[:id])
  	 		@circuit.destroy
 
  	 	 	redirect_to circuits_path
    end
  end
  	private
  	def circuit_params
  		params.require(:circuit).permit(:carrier, :contract, :purpose, :expiration, :rate)
  	end

end	
