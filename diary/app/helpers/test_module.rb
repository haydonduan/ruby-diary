  module Test
  def right?
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
