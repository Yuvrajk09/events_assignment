class AttendanceStatusesController < ApplicationController
  before_action :set_attendance_status, only: %i[show edit update destroy]

  def index
    @q = AttendanceStatus.ransack(params[:q])
    @attendance_statuses = @q.result(distinct: true).includes(:attendance).page(params[:page]).per(10)
  end

  def show; end

  def new
    @attendance_status = AttendanceStatus.new
  end

  def edit; end

  def create
    @attendance_status = AttendanceStatus.new(attendance_status_params)

    if @attendance_status.save
      redirect_to @attendance_status,
                  notice: "Attendance status was successfully created."
    else
      render :new
    end
  end

  def update
    if @attendance_status.update(attendance_status_params)
      redirect_to @attendance_status,
                  notice: "Attendance status was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @attendance_status.destroy
    redirect_to attendance_statuses_url,
                notice: "Attendance status was successfully destroyed."
  end

  private

  def set_attendance_status
    @attendance_status = AttendanceStatus.find(params[:id])
  end

  def attendance_status_params
    params.require(:attendance_status).permit(:attendance_id, :status)
  end
end
