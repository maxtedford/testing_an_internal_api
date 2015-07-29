class PoptartsController < ApplicationController
  
  def index
    respond_with Poptart.all
  end
end
