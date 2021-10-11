require 'bcrypt'

signup_password = BCrypt::Password.create("sanriko")
puts signup_password
login_password = BCrypt::Password.new(signup_password)
puts login_password
if login_password == "sanriko" # params[:pass]
  p "ログイン成功"
end

puts User.find_by(uid: "kindai")