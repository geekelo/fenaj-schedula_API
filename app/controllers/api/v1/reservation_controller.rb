class Api::V1::ReservationController < ApplicationController
  before_action :authenticate_token!
end
