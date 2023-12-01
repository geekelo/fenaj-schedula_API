class Api::ItemsController < ApplicationController
  before_action :set_api_session, only: %i[show edit update destroy]

  # GET /api/items or /api/items.json
  def index
    @api_sessions = Api::Session.all
  end

  # GET /api/items/1 or /api/items/1.json
  def show; end
end
