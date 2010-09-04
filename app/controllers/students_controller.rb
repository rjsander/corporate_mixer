class StudentsController < ApplicationController
  def index
    @students = Student.all
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
      PostOffice.deliver_waitlist_msg(@student) 
      
    else
      @student.active = true
      PostOffice.deliver_registration_msg(@student) 
    end
    
    if @student.save
      flash[:notice] = "Successfully created student."
      redirect_to @student
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
