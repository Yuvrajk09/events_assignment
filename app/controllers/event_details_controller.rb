class EventDetailsController < ApplicationController
  before_action :set_event_detail, only: [:show, :edit, :update, :destroy]

  # GET /event_details
  def index
    @event_details = EventDetail.all
  end

  # GET /event_details/1
  def show
  end

  # GET /event_details/new
  def new
    @event_detail = EventDetail.new
  end

  # GET /event_details/1/edit
  def edit
  end

  # POST /event_details
  def create
    @event_detail = EventDetail.new(event_detail_params)

    if @event_detail.save
      redirect_to @event_detail, notice: 'Event detail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /event_details/1
  def update
    if @event_detail.update(event_detail_params)
      redirect_to @event_detail, notice: 'Event detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /event_details/1
  def destroy
    @event_detail.destroy
    redirect_to event_details_url, notice: 'Event detail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_detail
      @event_detail = EventDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_detail_params
      params.require(:event_detail).permit(:event_id, :event_name, :event_startdate, :event_start_time, :event_details, :event_end_date, :event_end_time, :event_location)
    end
end
