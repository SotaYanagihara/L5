class TopController < ApplicationController
  def main
    render 'login'
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user and BCrypt::Password.new(user.pass) == params[:pass]
      #TODO: ログイン成功したことをユーザに知らせる
      session[:login_uid] = user.uid
      redirect_to root_path, notice: "ログイン成功"
    else
      #TODO: エラーメッセージ
      flash.now[:alert] = "uidかpasswordが間違っています"
      render 'login'
    end
  end

  def logout
    #TODO: ログアウトに成功したことをユーザに知らせる
    session.delete(:login_uid)
    redirect_to root_path, notice: "ログアウトしました"
  end
end
