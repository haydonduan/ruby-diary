# encoding: utf-8
class UserController < ApplicationController
		# 登录拦截器
		before_filter :login_user_filter, :except => [:login_page,:attemp_login]

		def new
		end

		#创建用户
		def create
				@user = User.new(params[:user])
				if @user.save
						render(:text => "success")
				else
						render(:text => "failed")
				end
		end

		#跳转到登录界面
		def login_page
		end

		#登录逻辑
		def attemp_login

				@user = User.find_by_name(params[:name])

				if @user
						if @user.password == params[:password]
								session[:user_id] = @user.id
								session[:user_name] = @user.name
								redirect_to(:controller => "note", :action => "index")
						else
								redirect_to(:action => "login_page")
						end
				else
						redirect_to(:action => "login_page")
				end

		end

		#退出
		def logout
				session[:user_id] = nil
				session[:user_name] = nil
				redirect_to(:action => "login_page")
		end

end
