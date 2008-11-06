class <%= controller_class_name %>Controller < ApplicationController
  
  # GET /<%= controller_plural_name %>
  def index
    @<%= controller_plural_name %> = <%= name.capitalize %>.find(:all)
  end

  # GET /<%= controller_plural_name %>/1
  def show
    @<%= name %> = <%= name.capitalize %>.find(params[:id])
  end

  # GET /<%= controller_plural_name %>/new
  def new
    @<%= name %> = <%= name.capitalize %>.new
  end

  # GET /<%= controller_plural_name %>/1/edit
  def edit
    @<%= name %> = <%= name.capitalize %>.find(params[:id])
  end

  # POST /<%= controller_plural_name %>
  def create
    @<%= name %> = <%= name.capitalize %>.new(params[:<%= name %>])

    if @<%= name %>.save
      flash[:notice] = '<%= name.capitalize %> was successfully created.'
      redirect_to(@<%= name %>)
    else
      render :action => "new"
    end
  end

  # PUT /<%= controller_plural_name %>/1
  def update
    @<%= name %> = <%= name.capitalize %>.find(params[:id])

    if @<%= name %>.update_attributes(params[:<%= name %>])
      flash[:notice] = '<%= name.capitalize %> was successfully updated.'
      redirect_to(@<%= name %>)
    else
      render :action => "edit"
    end
  end

  # DELETE /<%= controller_plural_name %>/1
  def destroy
    @<%= name %> = <%= name.capitalize %>.find(params[:id])
    @<%= name %>.destroy

    redirect_to(<%= controller_plural_name %>_url)
  end
end
