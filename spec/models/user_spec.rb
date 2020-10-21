# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'John Smith', password: 'password', email: 'user@user.com') }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without valid email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without valid a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
