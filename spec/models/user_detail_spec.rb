require 'rails_helper'

RSpec.describe UserDetail, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:events) }

    end

    describe "InDirect Associations" do

    it { should have_many(:comments_details) }

    end

    describe "Validations" do

    end
end
