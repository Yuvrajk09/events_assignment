require 'rails_helper'

RSpec.describe EventDetailResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'event_details',
          attributes: { }
        }
      }
    end

    let(:instance) do
      EventDetailResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { EventDetail.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:event_detail) { create(:event_detail) }

    let(:payload) do
      {
        data: {
          id: event_detail.id.to_s,
          type: 'event_details',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      EventDetailResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { event_detail.reload.updated_at }
      # .and change { event_detail.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:event_detail) { create(:event_detail) }

    let(:instance) do
      EventDetailResource.find(id: event_detail.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { EventDetail.count }.by(-1)
    end
  end
end
