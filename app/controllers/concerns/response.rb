module Response
  # responds with JSON and an HTTP status code 200
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end