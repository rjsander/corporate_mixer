class StudentsController < ApplicationController
  before_filter :login_required, :except => [:new, :create] 
  def index
    @students = Student.by_registration_time
    
    @nsbe_students = Student.get_nsbe.by_registration_time
    @shpe_students = Student.get_shpe.by_registration_time
  end
  
  def show
    @student = Student.find(params[:id])
  end
  
  def new
    @student = Student.new
  end
  
  def create
    
    @student = Student.new(params[:student])
    if (Student.get_affiliation(@student.affiliation).size >= 20)
      @student.active = false
    else
      @student.active = true
    end
    
    if @student.save
      
      if (Student.get_affiliation(@student.affiliation).size >= 20)
        flash[:notice] = "You have been waitlisted for the NSBE/SHPE Corporate Mixer.  All the slots are full.  You will be notified by email if you are removed from the waitlist."
        PostOffice.deliver_waitlist_msg(@student) 
      else 
        flash[:notice] = "You are now registered for the NSBE/SHPE Corporate Mixer.  Please check your email for confirmation."
        PostOffice.deliver_registration_msg(@student) 
      end
      
      redirect_to :controller => 'home', :action => 'index'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      flash[:notice] = "Successfully updated student."
      redirect_to @student
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:notice] = "Successfully destroyed student."
    redirect_to students_url
  end
end
