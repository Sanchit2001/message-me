class SessionsController < ApplicationController
    before_action :logged_in_redirect, only: [:new, :create]
    def new
    end

    def create
        logger.debug "Create called"
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "Logged in Successfully"
            logger.debug "Logged in user"
            redirect_to root_path
        else
            flash[:error] = "Wrong Credentials"
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Logged Out"
        redirect_to login_path
    end

    def logged_in_redirect
        if logged_in?
            flash[:success] ="Already logged in"
            redirect_to root_path
        end
    end

end