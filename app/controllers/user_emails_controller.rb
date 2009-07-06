class UserEmailsController < ApplicationController
  # GET /user_emails
  # GET /user_emails.xml
  def index
    @user_emails = UserEmail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_emails }
    end
  end

  # GET /user_emails/1
  # GET /user_emails/1.xml
  def show
    @user_email = UserEmail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_email }
    end
  end

  # GET /user_emails/new
  # GET /user_emails/new.xml
  def new
    @user_email = UserEmail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_email }
    end
  end

  # GET /user_emails/1/edit
  def edit
    @user_email = UserEmail.find(params[:id])
  end

  # POST /user_emails
  # POST /user_emails.xml
  def create
    @user_email = UserEmail.new(params[:user_email])

    respond_to do |format|
      if @user_email.save
        flash[:notice] = 'UserEmail was successfully created.'
        format.html { redirect_to(@user_email) }
        format.xml  { render :xml => @user_email, :status => :created, :location => @user_email }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_email.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_emails/1
  # PUT /user_emails/1.xml
  def update
    @user_email = UserEmail.find(params[:id])

    respond_to do |format|
      if @user_email.update_attributes(params[:user_email])
        flash[:notice] = 'UserEmail was successfully updated.'
        format.html { redirect_to(@user_email) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_email.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_emails/1
  # DELETE /user_emails/1.xml
  def destroy
    @user_email = UserEmail.find(params[:id])
    @user_email.destroy

    respond_to do |format|
      format.html { redirect_to(user_emails_url) }
      format.xml  { head :ok }
    end
  end
end
