class ActorsController < ApplicationController
  def index
    # Read all actors
    @actors = Actor.all
  end

  def show
    # Reads one actor bio
    @actor = Actor.find(params[:id])
  end

  def new_form
    # Create form for new actor
  end

  def create_row
    # Creates row in database for new actor
    @actor = Actor.new
    @actor.dob = params[:dob]
    @actor.name = params[:name]
    @actor.bio = params[:bio]
    @actor.image_url = params[:image_url]

    @actor.save

    render("show")
  end

  def edit_form
    # Update form for existing actor
    @actor = Actor.find(params[:id])
    
    render("/actors/edit_form.html.erb")
  end

  def update_row
    # Updates row for existing actor
    @actor = Actor.find(params[:id])

    @actor.dob = params[:dob]
    @actor.name = params[:name]
    @actor.bio = params[:bio]
    @actor.image_url = params[:image_url]

    @actor.save

    render("/actors/show.html.erb")
  end

  def destroy
    # Destroys row for existing actor
    @actor = Actor.find(params[:id])

    @actor.destroy
  end
end
