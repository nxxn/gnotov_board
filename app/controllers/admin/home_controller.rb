class Admin::HomeController < AdminController

  def index
    @users = User.all
    @ads = Ad.all
  end

end
