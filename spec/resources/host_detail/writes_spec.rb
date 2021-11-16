require "rails_helper"

RSpec.describe HostDetailResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "host_details",
          attributes: {},
        },
      }
    end

    let(:instance) do
      HostDetailResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { HostDetail.count }.by(1)
    end
  end

  describe "updating" do
    let!(:host_detail) { create(:host_detail) }

    let(:payload) do
      {
        data: {
          id: host_detail.id.to_s,
          type: "host_details",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      HostDetailResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { host_detail.reload.updated_at }
      # .and change { host_detail.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:host_detail) { create(:host_detail) }

    let(:instance) do
      HostDetailResource.find(id: host_detail.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { HostDetail.count }.by(-1)
    end
  end
end
