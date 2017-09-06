class Invitation < ApplicationRecord
  has_secure_token :access_code
end
