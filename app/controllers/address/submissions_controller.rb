class Address::SubmissionsController < ApplicationController
  before_action :set_invite, only: [:new, :create]
  def login
    @login = LoginToVerify.new
  end

  def process_login
    @outcome = LoginToVerify.run(login_params)
    unless @outcome.result == false
      session['invite_id'] = @outcome.result
      set_invite
      unless @invite.used?
        redirect_to new_address_submission_url
      else
        session.delete(:invite_id)
        redirect_to address_submissions_url, notice: 'Sorry, this access code has already been used.'
      end
    end
  end

  def new
    redirect_to address_submissions_url unless session['invite_id']
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      @invite.update(used: true)
      session.delete(:invite_id)
      redirect_to success_address_submissions_url, notice: 'Expect a postcard to arrive within 5 days.'
    end
  end

  def success
    
  end

  private

  def set_invite
    @invite = Invitation.find(session['invite_id'])
  end

  def login_params
    params.require(:login_to_verify).permit(:access_code)
  end

  def address_params
    params.require(:address).permit(:name, :company, :line1, :line2, :city, :state, :zip, :phone, :email)
  end
end
