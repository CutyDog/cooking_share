class Api::UsersController < Api::Base
  def create
    u = User.new(user_params)
    u.save!
    cookies[:authed] = { value: u.set_session_key, expires: 1.hour.from_now }
    render json: {state:"success",msg:"Signin Success"} , status: 200
  rescue
    render json: {state:"failure",msg:"Error"} , status: 403
  end

  def log_in
    # Cookieがなければ、無条件にエラー
    return render json: {state:"failure",msg:"Error"} , status: 403 if cookies[:authed].nil?

    # Cookieの内容から、userを検索
    user = User.find_by(session_key: cookies[:authed])

    # usermが取得できていれば、nameを返す
    if user
      render json: {state:"success",msg:"User profile",log_in: {name:user.name } } , status: 200
    else
      render json: {state:"failure",msg:"Error"} , status: 403
    end
  end
  

  def log_out

    return render json: {state:"failure",msg:"Error"} , status: 403 if cookies[:authed].nil?

    user = User.find_by(session_key: cookies[:authed])

    # cookieを削除
    cookies.delete :authed

    render json: {state:"success",msg:"Log Outed" } , status: 200
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :password)
  end
end