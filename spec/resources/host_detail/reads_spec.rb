require "rails_helper"

RSpec.describe HostDetailResource, type: :resource do
  describe "serialization" do
    let!(:host_detail) { create(:host_detail) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(host_detail.id)
      expect(data.jsonapi_type).to eq("host_details")
    end
  end

  describe "filtering" do
    let!(:host_detail1) { create(:host_detail) }
    let!(:host_detail2) { create(:host_detail) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: host_detail2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([host_detail2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:host_detail1) { create(:host_detail) }
      let!(:host_detail2) { create(:host_detail) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      host_detail1.id,
                                      host_detail2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      host_detail2.id,
                                      host_detail1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
