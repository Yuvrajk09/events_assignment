require 'rails_helper'

RSpec.describe "comments_details#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/comments_details", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'comments_details',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(CommentsDetailResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { CommentsDetail.count }.by(1)
    end
  end
end
