class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = assign_params
        
        if @user.save
            flash[:notice] = "Welcome to Bloccit #{@user.name}!"
            create_session(@user)
            redirect_to root_path
        else
            flash[:error] = "There was an error creating your account. Please try again."
            render :new
        end
    end
    
    private
    
    def assign_params
        User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    end
end