class Api::ReservationsController < ApplicationController
  # GET /api/reservations or /api/reservations.json
  def index
    @api_reservations = Api::Reservation.all

    render json: {
      city:,
      date:,
      user:,
      item:
    }
  end

  # GET /api/reservations/1 or /api/reservations/1.json
  def show
    render json: {
      city:,
      date:,
      user:,
      item:
    }
  end

  private

  def reservation_params
    params.require(:reservation).permit(:city, :date, :user, :item)
  end
end
