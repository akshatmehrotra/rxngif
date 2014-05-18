class PicturesController < ApplicationController
  def index
    @list_of_pictures = Picture.all

  end

  def show
    # Your code goes here
    # Use the information after the slash in the URL to look up the director with the corresponding ID number
    # Store the director in the @director instance variable so the view can format it

    @picture = Picture.find_by({ :id => params[:id] })
  end

  def create
    caption = params[:caption]
    source = params[:source]

    @new_picture = Picture.new
    @new_picture.caption = caption
    @new_picture.source = source
    @new_picture.save
    redirect_to("/all_pictures")
  end

  def destroy
    @picture = Picture.find_by({ :id => params[:id] })
    @picture.destroy
    redirect_to("/all_pictures")
  end

  def edit
    @picture = Picture.find_by({:id => params[:id]})
  end

  def update

    caption = params[:caption]
    source = params[:source]

    @updated_picture = Picture.find_by({:id=> params[:id]})
    @updated_picture.caption = caption
    @updated_picture.source = source
    @updated_picture.save
    redirect_to("/all_pictures")
  end


end
