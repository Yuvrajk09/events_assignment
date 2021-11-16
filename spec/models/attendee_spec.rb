require "rails_helper"

RSpec.describe Attendee, type: :model do
  describe "Direct Associations" do
    it { should have_one(:attendance_status) }

    it { should belong_to(:event) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
