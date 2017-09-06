class LoginToVerify < ActiveInteraction::Base
  string :access_code

  def execute
    if Invitation.exists?(access_code: access_code)
      invitation_id = Invitation.find_by(access_code: access_code).id
      invitation_id
    else
      errors.add(:access_code, 'does not exist.')
    end
  end
end
