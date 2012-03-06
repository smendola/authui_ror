class UsersController < ApplicationController

  def initialize
    @svc = JsonRpcClient.new 'http://localhost:3001/service/auth'
  end

  # GET /users
  # GET /users.xml
  def index

    @js_file_names = ['user_index.js']

    @roles = [['Administrator','Admin'], ['Guest','Guest'], ['Reviewer', "Reviewer"]]

    role_name = params[:role_name_filter]
    if role_name.blank?
      @users = @svc.ListUsers.map do |container|
        User.new container['user']
      end
    else
      @users = @svc.ListUsersInRole(role_name).map do |container|
            User.new container['user']
      end
    end
    render :layout => 'application'
=begin
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
=end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    container = @svc.GetUser params[:username]
    @user = User.new container['user']

=begin
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
=end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

=begin
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
=end
  end

  # GET /users/1/edit
  def edit
    container = @svc.GetUser params[:username]
    @user = User.new container['user']
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end

  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    no_error = true
    begin
      # update the user
      container = @svc.UpdateUser({:user => params[:user]})
      @user = User.new container['user']
    rescue Exception => e
      # get the user because something went wrong and the edit template expect a real user model
      container = @svc.GetUser params[:username]
      @user = User.new container['user']

      no_error = false
      @user.errors.add(:name, e.inspect)
    end

    respond_to do |format|
      if no_error
        format.html { redirect_to(:action => 'show', :username => params[:user][:username], :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @svc.DeleteUser params[:username]

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
