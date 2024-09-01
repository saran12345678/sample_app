module SessionsHelper

  # 渡されたユーザでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  # 現在ログイン中のユーザを返す(存在する場合)
  def current_user
    if session[:user_id]
      @curent_user ||= User.find_by(id: session[:user_id])
    end
  end

  # ユーザがログインしていればTrue,その他ならFalseを返す
  def logged_in?
    !current_user.nil?
  end

  # 現在のユーザーをログアウトする
  def log_out
    reset_session
    @current_user = nil # 安全のため
  end
end
