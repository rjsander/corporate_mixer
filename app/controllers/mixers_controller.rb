class MixersController < ApplicationController
  before_filter :login_required
  def index
    @mixers = Mixer.all
  end
  
  def show
    @mixer = Mixer.find(params[:id])
  end
  
  def new
    @mixer = Mixer.new
  end
  
  def create
    @mixer = Mixer.new(params[:mixer])
    if @mixer.save
      flash[:notice] = "Successfully created mixer."
      redirect_to @mixer
    else
      render :action => 'new'
    end
  end
  
  def edit
    @mixer = Mixer.find(params[:id])
  end
  
  def update
    @mixer = Mixer.find(params[:id])
    if @mixer.update_attributes(params[:mixer])
      flash[:notice] = "Successfully updated mixer."
      redirect_to @mixer
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @mixer = Mixer.find(params[:id])
    @mixer.destroy
    flash[:notice] = "Successfully destroyed mixer."
    redirect_to mixers_url
  end
end
