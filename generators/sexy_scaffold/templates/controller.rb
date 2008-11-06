class <%= controller_class_name %>Controller < ApplicationController
  
  # GET /<%= controller_plural_name %>
  def index
    @<%= name.downcase.pluralize %> = <%= name.capitalize %>.find(:all)
  end

  # GET /<%= controller_plural_name %>/1
  def show
    @<%= name.downcase %> = <%= name.capitalize %>.find(params[:id])
  end

  # GET /<%= controller_plural_name %>/new
  def new
    @<%= name.downcase %> = <%= name.capitalize %>.new
  end

  # GET /<%= controller_plural_name %>/1/edit
  def edit
    @<%= name.downcase %> = <%= name.capitalize %>.find(params[:id])
  end

  # POST /<%= controller_plural_name %>
  def create
    @<%= name.downcase %> = <%= name.capitalize %>.new(params[:<%= name.downcase %>])

    if @<%= name.downcase %>.save
      flash[:notice] = '<%= name.capitalize %> was successfully created.'
      redirect_to(@<%= name.downcase %>)
    else
      render :action => "new"
    end
  end

  # PUT /<%= controller_plural_name %>/1
  def update
    @<%= name.downcase %> = <%= name.capitalize %>.find(params[:id])

    if @<%= name.downcase %>.update_attributes(params[:<%= singular_name %>])
      flash[:notice] = '<%= name.capitalize %> was successfully updated.'
      redirect_to(@<%= name.downcase %>)
    else
      render :action => "edit"
    end
  end

  # DELETE /<%= controller_plural_name %>/1
  def destroy
    <%= name.capitalize %>.find(params[:id]).destroy

    redirect_to(<%= name.downcase.pluralize %>_url)
  end
end
