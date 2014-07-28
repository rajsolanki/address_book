class Person < ActiveRecord::Base
  validates :first_name, :last_name, :email, :address_line_one, :city, :state, :zip_code, presence: true
  validates :email, uniqueness: true, on: :create
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  }
  validates :zip_code, format: {
    with: %r{\d{5}(-\d{4})?},
    message: 'should be 12345 or 12345-1234 format'
  }
  validates :state, exclusion: {
    in: %w(Select State),
    message: '- Please select a state from the drop down menu'
  }
end
