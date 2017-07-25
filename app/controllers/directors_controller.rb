class DirectorsController < ApplicationController
  def index
    # Read all directors
    @directors = Director.all
    
    render("/directors/index.html.erb")
  end

  def show
    # Read one director
    @director = Director.find(params[:id])
    
    render("/directors/show_details")
  end

  # def new
  # end

  def update_row
    
    # Update row in file
    
    @director = Director.find(params[:id])
    
    @director.dob = params[:dob]
    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    @director.save

    render("/directors/show_details")
  end

  def edit_form
    # Update form 
    @director = Director.find(params[:id])
  end

  def create_row
    
    # Create new row 
    
    @director = Director.new

    @director.dob = params[:dob]
    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    @director.save

    render("/directors/show_details.html.erb")
  end

  def destroy
    # Destroys Row
    @director = Director.find(params[:id])

    @director.destroy
  end
end
