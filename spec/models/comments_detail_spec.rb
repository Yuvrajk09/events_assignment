require 'rails_helper'

RSpec.describe CommentsDetail, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:event_comment) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
