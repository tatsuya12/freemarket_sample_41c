require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    context 'valid' do
      it "is valid with a name, email, password " do
        user = build(:user)
        expect(user).to be_valid
      end

      it "is valid with a name that has less than 20 characters " do
        user = build(:user, name: "asasasasasasasasasas")
        expect(user).to be_valid
      end
    end

    context 'invalid' do
      it 'is invalid without a name' do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end

      it "is invalid without a email" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "is invalid without a password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "is invalid without a password_confirmation although with a password" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "is invalid with duplicate email" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      it "is invalid with a name that has more than 21 characters " do
        user = build(:user, name: "asasasasasasasasasasa")
        user.valid?
        expect(user.errors[:name][0]).to include("is too long")
      end

    end
  end
end
