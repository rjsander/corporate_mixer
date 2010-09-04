class CorporationsController < ApplicationController
  def index
    @corporations = Corporation.all
  end
  
  def show
    @corporation = Corporation.find(params[:id])
  end
  
  def new
    @corporation = Corporation.new
  end
  
  def create
    @corporation = Corporation.new(params[:corporation])
    if @corporation.save
      flash[:notice] = "Successfully created corporation."
      redirect_to @corporation
    else
      render :action => 'new'
    end
  end
  
  def edit
    @corporation = Corporation.find(params[:id])
  end
  
  def update
    @corporation = Corporation.find(params[:id])
    if @corporation.update_attributes(params[:corporation])
      flash[:notice] = "Successfully updated corporation."
      redirect_to @corporation
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @corporation = Corporation.find(params[:id])
    @corporation.destroy
    flash[:notice] = "Successfully destroyed corporation."
    redirect_to corporations_url
  end
end
