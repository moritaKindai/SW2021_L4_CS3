require 'bcrypt'

class TopController < ApplicationController
  def main
    if session[:login_uid]
      render "main"
    else
      render "login"
    end
  end
  def login
    if User.find_by(uid: params[:uid]) #, pass: params[:pass])
      #puts User.find_by(uid: params[:pass])
      
      #if BCrypt::Password.new(params[:pass]) == User.find_by(uid: params[:uid])
      #  puts "成功"
      #end
      #if login_password == params[:pass]
        session[:login_uid] = params[:uid]
        redirect_to root_path
      #end
    else
      render "error"
    end
  end
  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end