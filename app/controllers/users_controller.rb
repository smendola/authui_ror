class UsersController < ApplicationController

  def initialize
    @svc = JsonRpcClient.new 'http://localhost:3001/service/auth'
  end

  # GET /users
  # GET /users.xml
  def index
    @users = @svc.ListUsers.map do |container|
          User.new container['user']
    end

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
    @user = User.new

    logger.debug params
    logger.debug params[:user]
    logger.debug params[:user][:username]

    # username = params[:username]
    # first_name = params[:first_name]
    # last_name = params[:last_name]

    no_error = true
    begin
      container = @svc.UpdateUser({:userx => params[:user]})
    rescue Exception => e
      no_error = false
      @user.errors.add(:name, e.inspect)
    end

    respond_to do |format|
      if no_error
        format.html { redirect_to(:action => 'show', :username => params[:user][:username], :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        logger.debug "Errors = " + @user.errors.inspect
        format.html { render "/users/"+params[:user][:username]+"/edit" }
        # format.html { redirect_to(:action => 'edit', :username => params[:user][:username], :notice => 'User was NOT successfully updated.') }
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
