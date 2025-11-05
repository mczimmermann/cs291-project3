class HealthController < ApplicationController
  # GET /health
  def show
    render json: { status: "ok", timestamp: Time.now.utc.iso8601 }
  end
end