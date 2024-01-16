class BreedsController < ApplicationController
  def show
  end

  def update
    render turbo_stream: turbo_stream.replace("dog-image", partial: "breeds/dog-image", locals: { url: "https://images.dog.ceo/breeds/terrier-yorkshire/n02094433_6338.jpg" })
  end
end
