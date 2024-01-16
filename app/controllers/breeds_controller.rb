class BreedsController < ApplicationController
  def show
  end

  def update
    response = Faraday.get("https://dog.ceo/api/breed/#{params["breed"]}/images/random")
    url = JSON.parse(response.body)["message"]
    render turbo_stream: turbo_stream.replace("dog-image", partial: "breeds/dog-image", locals: { url: url })
  end
end
