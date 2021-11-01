require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test - ensure User model has 1:m raltionship with todos
  it { should have_many(:todos) }
  
  # Validations test - ensure name, email and password are present before save
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
