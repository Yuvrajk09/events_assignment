require 'rails_helper'

RSpec.describe "attendance_statuses#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/attendance_statuses/#{attendance_status.id}"
  end

  describe 'basic destroy' do
    let!(:attendance_status) { create(:attendance_status) }

    it 'updates the resource' do
      expect(AttendanceStatusResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { AttendanceStatus.count }.by(-1)
      expect { attendance_status.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
