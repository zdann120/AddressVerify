class Invitation < ApplicationRecord
  has_secure_token :access_code
  def verified_address
    Address.find_by(id: used_by)
  end

end
