require "rails_helper"

RSpec.describe HostDetail, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:host) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
