class RegistrationController < ApplicationController
  
    # def index
    #   @ = .scoped
    # end
  
    def new
      @user = User.new()
    end

    def create
      @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Successfully created account"
      else
        render :new
      end
    end
  
    # def update
    #   @ = .find(params[:id])
    # end
  
    # def edit
    #   @ = .find(params[:id])
    # end
  
    # def destroy
    #   @ = .find(params[:id])
    # end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end