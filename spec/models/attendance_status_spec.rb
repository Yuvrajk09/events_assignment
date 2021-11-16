require "rails_helper"

RSpec.describe AttendanceStatus, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:attendance) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
