class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:edit, :update, :destroy]

  # GET /registrations/new
  def new
    @registration = Registration.new
  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations
  def create
    @registration = Registration.new(registration_params) do |r|
      r.registrable = User.new
    end

    if @registration.save
      # @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'       # Re-render the signup form.
    end
  end

  # PATCH/PUT /registrations/1
  def update
    if @registration.update(registration_params)
      redirect_to @registration, notice: 'Registration was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /registrations/1
  def destroy
    @registration.destroy
    redirect_to registrations_url, notice: 'Registration was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:email, :password, :password_confirmation)
    end
end
