module Brightcontent
  class SessionsController < ApplicationController
    skip_before_filter :authorize

    def new; end

    def create
      user = AdminUser.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:brightcontent_user_id] = user.id
        redirect_to root_url
      else
        flash.now.alert = 'Email or password is invalid'
        render :new
      end
    end

    def destroy
      session[:brightcontent_user_id] = nil
      redirect_to root_url
    end
  end
end
