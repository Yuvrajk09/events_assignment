require 'rails_helper'

RSpec.describe EventDetail, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:attendees) }

    it { should have_many(:comments_details) }

    it { should belong_to(:users) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
