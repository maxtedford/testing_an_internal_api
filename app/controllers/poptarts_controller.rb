class PoptartsController < ApplicationController
  
  def index
    respond_with Poptart.all
  end
  
  def show
    respond_with Poptart.find_by(id: params[:id])
  end
  
  def create
    poptart = Poptart.new(poptart_params)
    respond_with poptart
  end
  
  def update
    poptart = Poptart.find_by(id: params[:id])
    respond_with poptart.update(poptart_params)
  end
  
  def destroy
    poptart = Poptart.find_by(id: params[:id])
    respond_with poptart.destroy
  end
  
  private
  
  def poptart_params
    params.require(:poptart).permit(:flavor, :sprinkles)
  end
end
