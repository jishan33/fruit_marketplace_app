require 'rails_helper'

  RSpec.describe Farmer, type: :model do

    let(:user) {
    User.create(email: "user@example.org", password: "very-secret", user_type: "farmer")
    }
    let(:farmer) {
    Farmer.create(user_id: user.id, name: "John Lu", address: "farmer address", fruit_types: "apples", introduction: "hello I am a farmer")
    }


    subject {described_class.new(
      name: 'John',
      address: 'Glen yarra 123',
      fruit_types: 'Apples',
      introduction: 'I am a farmer',
      user_id: user.id
    )}

  context 'assocations' do
    it 'belongs to a User' do
      relation = Farmer.reflect_on_association(:user)
      expect(relation.macro).to eql(:belongs_to)
    end
  end

  context 'validations' do 

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

     it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a name less than 1 letter' do
      subject.name = '' 
      expect(subject).to_not be_valid
    end

    it 'is valid with a name less than 20 letters' do
      subject.name = 'Keanu reeves' 
      expect(subject).to be_valid
    end

    it 'is not valid with an address less than 12 letter' do
      subject.address = 'address' 
      expect(subject).to_not be_valid
    end

    it 'is valid with an address less than 50 letter' do
      subject.address = '33 farmer st, Geln yarra 3041' 
      expect(subject).to be_valid
    end

    it 'is not valid with a fruit_types less than 5 letter' do
      subject.fruit_types = 'a' 
      expect(subject).to_not be_valid
    end

    it 'is valid with a fruit_types less than 50 letter' do
      subject.fruit_types = 'Apples' 
      expect(subject).to be_valid
    end

    it 'is not valid with an introduction less than 10 letter' do
      subject.introduction = 'HEllO' 
      expect(subject).to_not be_valid
    end

    it 'is valid with an introduction less than 100 letter' do
      subject.introduction = 'HEllO, I AM A FARMER LIVING IN YARRA GLEN.' 
      expect(subject).to be_valid
    end

    it 'is not valid without an user_id' do
      subject.user_id = nil 
      expect(subject).to_not be_valid
    end


    it 'is valid with an user id' do
      subject.user_id = user.id 
      expect(subject).to be_valid
    end


  end


end


