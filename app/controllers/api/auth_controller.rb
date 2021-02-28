class Api::AuthController < Api::Base
  def verification
    if u = User.verification(auth_params)
      # 認証成功したので、
      # cookieにセッション情報を書き込み
      cookies[:authed] = { value: u.set_session_key, expires: 1.hour.from_now }
      render json: {state:"success",msg:"Login Success"} , status: 200
    else
      # 認証に失敗したので、エラーを返す。
      # 今回は簡単にエラーであることを通知
      render json: {state:"failure",msg:"Error"} , status: 403
    end
  end
  

  private
  def auth_params
    params.require(:user).permit(:name, :password)
  end
end