class DealersController < ApplicationController

  def show
    @dealer = User.find(params[:dealer])

    unless @dealer.dealer?
      redirect_to :back
    end
  end

end
