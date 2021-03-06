class <%= controller_class_name %>Controller < ApplicationController
  before_filter :assign_<%= singular_name %>, :only => [:show, :edit, :update, :destroy]

  def index
    #@<%= controller_plural_name %> = current_user.<%= singular_name.pluralize %>.find(:all)
    @<%= controller_plural_name %> = <%= name.capitalize %>.all
  end

  def show
  end

  def new
    @<%= singular_name %> = <%= name.capitalize %>.new
  end

  def edit
  end

  def create
    #@<%= singular_name %> = current_user.<%= singular_name.pluralize %>.new(params[:<%= singular_name %>])
    @<%= singular_name %> = <%= name.capitalize %>.new(params[:<%= singular_name %>])

    if @<%= singular_name %>.save
      flash[:notice] = '<%= name.capitalize %> was successfully created.'
      redirect_to(@<%= singular_name %>)
    else
      render :action => "new"
    end
  end

  def update
    if @<%= singular_name %>.update_attributes(params[:<%= singular_name %>])
      flash[:notice] = '<%= name.capitalize %> was successfully updated.'
      redirect_to(@<%= singular_name %>)
    else
      render :action => "edit"
    end
  end

  def destroy
    @<%= singular_name %>.destroy
    redirect_to(<%= singular_name.pluralize %>_url)
  end


  protected
  
  def assign_<%= singular_name %>
    begin
      #To confine the user to view only <%= singular_name.pluralize %> associated with them use the commented line instead, here and index and create.  Assumes authlogic and current_user method in application_controller
      #@<%= singular_name %> = current_user.<%= controller_plural_name %>.find(params[:id])
      @<%= singular_name %> = <%= name.capitalize %>.find(params[:id])
    rescue
      not_found!(<%= controller_plural_name %>_path) 
    end
  end


end
