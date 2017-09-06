class VerifyWithHaiku < ActiveInteraction::Base
  string :verification_code

  def execute
    if Address.exists?(verification_code: verification_code)
      @address = Address.find_by(verification_code: verification_code)
      unless @address.verified?
        @address.update(verified: true)
      else
        errors.add(:verification_code, 'has already been activated.')
      end
    end
  end
end
