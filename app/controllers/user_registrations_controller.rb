class UserRegistrationsController < ApplicationController

  def new
    @user_registration = UserRegistration.new
  end

  def create
    @user_registration = UserRegistration.new(params[:user_registration])
    begin
      @user_registration.save!
      flash[:notice] = "Created User successfully"
      redirect_to users_path
    rescue ActiveRecord::RecordInvalid
      render :action => 'new'
    end
  end

end
