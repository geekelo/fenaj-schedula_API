class Api::ReservationsController < ApplicationController
  # GET /api/reservations or /api/reservations.json
  def index
    @api_reservations = Api::Reservation.all

    render json: {
      city:,
      date:,
      user:,
      item:,
    }
  end

  # GET /api/reservations/1 or /api/reservations/1.json
  def show
    render json: {
      city:,
      date:,
      user:,
      item:,
    }
  end

  # DELETE /api/reservations/1 or /api/reservations/1.json
  def destroy
    item = Item.find(params[:id])
    if item.destroy
      render json: { status: "success", message: "Item deleted successfully" }
    else
      render json: { status: "error", message: "Failed to delete the item" }, status: :unprocessable_entity
    end
  end
end
