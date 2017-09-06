class Address::VerificationsController < ApplicationController
  def new
    @verification = VerifyWithHaiku.new
  end

  def create
    @verification = VerifyWithHaiku.run(verification_params)
    if @verification.valid?
      redirect_to root_url, notice: 'Thanks! Your address has been verified!'
    else
      render :new
    end
  end


  private

  def verification_params
    params.require(:verify_with_haiku).permit(:verification_code)
  end
end
