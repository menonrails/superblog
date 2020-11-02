class V1::UsersController < ApplicationController
  def index
    render json: {popka: 'durak'}.to_json
  end
end
