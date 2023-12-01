class Api::ItemsController < ApplicationController
  before_action :set_api_session, only: %i[show edit update destroy]

  # GET /api/items or /api/items.json
  def index
    @api_items = Api::Item.all
    render json: {
      name:,
      description:,
      deposit:,
      spa_session_fee:,
      registration_fee:,
      total_amount_payable:,
      duration:,
      user:
    }
  end

  # GET /api/items/1 or /api/items/1.json
  def show
    render json: {
      name:,
      description:,
      deposit:,
      spa_session_fee:,
      registration_fee:,
      total_amount_payable:,
      duration:,
      user:
    }
  end
end
