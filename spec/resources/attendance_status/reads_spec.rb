require 'rails_helper'

RSpec.describe AttendanceStatusResource, type: :resource do
  describe 'serialization' do
    let!(:attendance_status) { create(:attendance_status) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(attendance_status.id)
      expect(data.jsonapi_type).to eq('attendance_statuses')
    end
  end

  describe 'filtering' do
    let!(:attendance_status1) { create(:attendance_status) }
    let!(:attendance_status2) { create(:attendance_status) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: attendance_status2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([attendance_status2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:attendance_status1) { create(:attendance_status) }
      let!(:attendance_status2) { create(:attendance_status) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            attendance_status1.id,
            attendance_status2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            attendance_status2.id,
            attendance_status1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
