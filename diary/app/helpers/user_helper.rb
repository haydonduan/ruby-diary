require 'digest/sha1'
module UserHelper

		public
		def test
				puts "ddddddd"
		end

		def hashpassword(password)
			Digest::SHA1.hexdigest(password)
		end

		#1 用户名为空
		#2 密码为空
		#3 成功
		#4 密码错误
		#5 用户不存在
		def is_right?
				name = params[:name]
				psw  = params[:password]
				if name.blank?
						return 1
				end
				if psw.blank?
						return 2
				end

				user = User.find_by_name(name)
				if user
						if user.password == psw
								session[:user_id]   = user.id
								session[:user_name] = user.name
								return 3
						else
								return 4
						end
				else
						return 5
				end	
				end
end
