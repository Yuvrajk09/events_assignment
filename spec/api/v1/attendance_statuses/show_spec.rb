require "rails_helper"

RSpec.describe "attendance_statuses#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/attendance_statuses/#{attendance_status.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:attendance_status) { create(:attendance_status) }

    it "works" do
      expect(AttendanceStatusResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("attendance_statuses")
      expect(d.id).to eq(attendance_status.id)
    end
  end
end
