class Api::UsersController < Api::Base
  def profile
    # Cookieがなければ、無条件にエラー
    return render json: {state:"failure",msg:"Error"} , status: 403 if cookies[:authed].nil?

    # Cookieの内容から、userを検索
    user = User.find_by(session_key: cookies[:authed])

    # usermが取得できていれば、nameを返す
    if user
      render json: {state:"success",msg:"User profile",profile: {name:user.name } } , status: 200
    else
      render json: {state:"failure",msg:"Error"} , status: 403
    end
  end

  def log_out

    return render json: {state:"failure",msg:"Error"} , status: 403 if cookies[:authed].nil?

    user = User.find_by(session_key: cookies[:authed])

    # cookieを削除
    cookies.delete :authed

    if user.remove_session_key
      render json: {state:"success",msg:"Log Outed" } , status: 200
    else
      render json: {state:"failure",msg:"Error"} , status: 403
    end
  end
end