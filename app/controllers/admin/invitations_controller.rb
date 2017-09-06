class Admin::InvitationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @invitations = Invitation.all
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new
    if @invitation.save
      redirect_to admin_invitations_url, notice: "NEW INVITE CODE: #{@invitation.access_code}"
    else
      redirect_to admin_invitations_url
    end
  end
end
