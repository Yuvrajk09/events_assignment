require 'rails_helper'

RSpec.describe "attendance_statuses#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/attendance_statuses", params: params
  end

  describe 'basic fetch' do
    let!(:attendance_status1) { create(:attendance_status) }
    let!(:attendance_status2) { create(:attendance_status) }

    it 'works' do
      expect(AttendanceStatusResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['attendance_statuses'])
      expect(d.map(&:id)).to match_array([attendance_status1.id, attendance_status2.id])
    end
  end
end
