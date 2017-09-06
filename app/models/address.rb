class Address < ApplicationRecord
  before_create :set_verification_code
  after_create :send_postcard

  
  private

  def set_verification_code
    self.verification_code = loop do
      haiku = Haikunator.haikunate
      break haiku unless Address.exists?(verification_code: haiku)
    end
  end

  def send_postcard
    postcard = LOB.postcards.create(
      description: description,
      to: {
        name: name,
        company: company,
        address_line1: line1,
        address_line2: line2,
        address_city: city,
        address_state: state,
        address_zip: zip
      },
      from: {
        company: ENV['POSTCARD_COMPANY_NAME'],
        address_line1: ENV['POSTCARD_ADDRESS_LINE1'],
        address_line2: ENV['POSTCARD_ADDRESS_LINE2'],
        address_city: ENV['POSTCARD_ADDRESS_CITY'],
        address_state: ENV['POSTCARD_ADDRESS_STATE'],
        address_zip: ENV['POSTCARD_ADDRESS_ZIP']
      },
      front: "https://consensus.zachapps.com/uploads/document/file/2/AddressVerificationCardFront.pdf",
      message: "Hello #{self.name},\nYour verification code is:\n#{self.verification_code}\n\nPlease visit:\naddress.zdnenterprises.com/verify\nto finish creating your account."
    )
    self.update(postcard_id: postcard['id'])
  end
end
