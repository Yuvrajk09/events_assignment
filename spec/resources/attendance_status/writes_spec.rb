require "rails_helper"

RSpec.describe AttendanceStatusResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "attendance_statuses",
          attributes: {},
        },
      }
    end

    let(:instance) do
      AttendanceStatusResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { AttendanceStatus.count }.by(1)
    end
  end

  describe "updating" do
    let!(:attendance_status) { create(:attendance_status) }

    let(:payload) do
      {
        data: {
          id: attendance_status.id.to_s,
          type: "attendance_statuses",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      AttendanceStatusResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { attendance_status.reload.updated_at }
      # .and change { attendance_status.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:attendance_status) { create(:attendance_status) }

    let(:instance) do
      AttendanceStatusResource.find(id: attendance_status.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { AttendanceStatus.count }.by(-1)
    end
  end
end
