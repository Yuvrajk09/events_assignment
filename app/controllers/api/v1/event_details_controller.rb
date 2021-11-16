class Api::V1::EventDetailsController < Api::V1::GraphitiController
  def index
    event_details = EventDetailResource.all(params)
    respond_with(event_details)
  end

  def show
    event_detail = EventDetailResource.find(params)
    respond_with(event_detail)
  end

  def create
    event_detail = EventDetailResource.build(params)

    if event_detail.save
      render jsonapi: event_detail, status: 201
    else
      render jsonapi_errors: event_detail
    end
  end

  def update
    event_detail = EventDetailResource.find(params)

    if event_detail.update_attributes
      render jsonapi: event_detail
    else
      render jsonapi_errors: event_detail
    end
  end

  def destroy
    event_detail = EventDetailResource.find(params)

    if event_detail.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: event_detail
    end
  end
end
