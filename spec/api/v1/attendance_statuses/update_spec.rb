require "rails_helper"

RSpec.describe "attendance_statuses#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/attendance_statuses/#{attendance_status.id}", payload
  end

  describe "basic update" do
    let!(:attendance_status) { create(:attendance_status) }

    let(:payload) do
      {
        data: {
          id: attendance_status.id.to_s,
          type: "attendance_statuses",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(AttendanceStatusResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { attendance_status.reload.attributes }
    end
  end
end
