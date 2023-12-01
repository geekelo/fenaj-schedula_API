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

  def create 
    reservation = Reservation.new(reservation_params)

    if reservation.save 
      render json: { message: 'Reservation has been successfully created.'}, status: :ok
      
      item = Item.find_by(id: reservation_params[:item_id])
      item.update(available: false) if item.present?
    else
      render json: {message: 'ERROR: unable to create reservation.'}, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:city, :date, :user_id, :item_id)
  end
end
