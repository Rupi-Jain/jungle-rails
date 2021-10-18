class UsersController < ApplicationController
 
  def new
  end

  def create
    puts "Hello create"
    p #{user_params}
    user = User.new(user_params)
    p user
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  # private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
  # end 
end
