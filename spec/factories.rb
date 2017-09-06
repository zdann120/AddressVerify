FactoryGirl.define do
  factory :admin_address, class: 'Admin::Address' do
    line1 "MyString"
    line2 "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    email "MyString"
    phone "MyString"
    verified false
  end
  factory :invitation do
    access_code ""
    used_by 1
    used false
  end
  factory :address do
    line1 "MyString"
    line2 "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    name "MyString"
    company "MyString"
    phone "MyString"
    metadata ""
    description "MyString"
    verification_code "MyString"
    verified false
  end
  factory :user do
    
  end
end
