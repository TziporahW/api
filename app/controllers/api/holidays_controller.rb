class Api::HolidaysController < ApplicationController
  def index
    response = HTTP
      .headers(({
        "Authorization" => "Bearer #{Rails.application.credentials.holidays_api[:key]}",
      }))
      .get("https://holidayapi.com/v1/holidays?pretty&country=#{params[:country]}&year=#{params[:year]}")
    render json: response.parse
  end
end
