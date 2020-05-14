require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(username: 'testuser', email:'test@t.com', password: '123456') }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a username' do
      subject.username = nil
      expect(subject).to_not be_valid
    end
  end
end
