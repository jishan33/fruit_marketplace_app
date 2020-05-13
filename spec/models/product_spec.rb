require 'rails_helper'


RSpec.describe Product, type: :model do
 let(:user) {
   User.create(email: "user@example.org", password: "very-secret", user_type: "farmer")
   }
 let(:farmer) {
   Farmer.create(user_id: user.id, name: "John Lu", address: "farmer address", fruit_types: "apples", introduction: "hello I am a farmer")
   }


 
  subject {
    
    described_class.new(

    title: 'Fruit Box',
    rank: 'A',
    description: 'Sweet and Tasty',
    quantity: 3,
    price: 100,
    farmer_id: farmer.id
  )}

  context 'assocaitions' do

    it 'belongs to a Farmer' do
      relation = Product.reflect_on_association(:farmer)
      expect(relation.macro).to eql(:belongs_to)
    end
  end
  
  context 'validation' do

    it 'is valid with valid attributes' do

      expect(subject).to be_valid
    end


    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a title has less than 1 letter' do
      subject.title = ""
      expect(subject).to_not be_valid
    end

     it 'is valid with a title has less than 15 letter' do
      subject.title = "Crispy Apples"
      expect(subject).to  be_valid
    end

    it 'is not valid without a rank' do
      subject.rank = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a rank has less than 1 letter' do
      subject.rank = ""
      expect(subject).to_not be_valid
    end

    it 'is valid with a rank has less than 2 letters' do
      subject.rank = "A+"
      expect(subject).to  be_valid
    end

    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a description has less than 1 letter' do
      subject.description = ""
      expect(subject).to_not be_valid
    end

    it 'is valid with a description has less than 20 letters' do
      subject.description = "sweet"
      expect(subject).to  be_valid
    end


    it 'is not valid without a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a quantity less than 0' do
      subject.quantity = 0
      expect(subject).to_not be_valid
    end

    it 'is not valid without a price' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a price less than 10' do
      subject.price = 9
      expect(subject).to_not be_valid
    end

    it 'is not valid without a farmer id' do
      subject.farmer_id = nil
      expect(subject).to_not be_valid
    end

    it 'is valid with a farmer id ' do
      subject.farmer_id = farmer.id
      expect(subject).to  be_valid
    end

  end

  context '#display_currency' do
      it 'converts the price to the string format' do
      expect(subject.display_currency).to eql('$100.00')
    end
  end

end