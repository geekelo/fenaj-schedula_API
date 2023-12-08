# frozen_string_literal: true

module Api
  module V1
    class ItemController < ApplicationController
      before_action :authenticate_token!
    end
  end
end
