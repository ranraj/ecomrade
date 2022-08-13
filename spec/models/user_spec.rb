require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensure name presence ' do
      user = User.new(password: 'tester').save
      expect(user).to eq(false)
    end

    it 'ensure password presence ' do
      user = User.new(name: 'tester',email: 'tester@in.com').save
      expect(user).to eq(false)
    end

    it 'ensure email presence ' do
      user = User.new(name: 'tester',password: 'tester').save
      expect(user).to eq(false)
    end
     

    it 'should saved successfuly' do
      user = User.new(name: "ranjith",password: "tester",email: "tester1@in.com").save
      expect(user).to eq(true)
    end

  end

  context 'scope tests' do
  end
    
end
