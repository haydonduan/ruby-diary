# encoding: utf-8
class UserController < ApplicationController

		include UserHelper
		# 登录拦截器
		before_filter :login_user_filter, :except => [:login_page,:attemp_login,:register,:create]

		def register
		end

		#创建用户
		def create
				@user = User.new(params[:user])
				if @user.save
						flash[:notice] = '注册成功'
				else
						flash[:notice] = 'regist failed'
				end
						render(:action => "register")
		end

		#跳转到登录界面
		def login_page
		end

		#登录逻辑
		def attemp_login

				#@user = User.find_by_name(params[:name])

				#if @user
				#		if @user.password == params[:password]
				#				session[:user_id] = @user.id
				#				session[:user_name] = @user.name
				#				redirect_to(:controller => "note", :action => "index")
				#		else
				#				redirect_to(:action => "login_page")
				#		end
				#else
				#		redirect_to(:action => "login_page")
				#end

				if is_right? == 1
						flash[:msg] = 'name is blank!'
						render(:action => 'login_page')
				elsif is_right? == 2
						flash[:msg] = 'password is blank!'
						render(:action => 'login_page')
				elsif is_right? == 3
						redirect_to(:controller => "note", :action => "index")
				elsif is_right? == 4
						flash[:msg] = 'password is wrong!'
						render(:action => 'login_page')
				else
						flash[:msg] = 'use is not exsit!'
						render(:action => 'login_page')
				end
		end

		#退出
		def logout
				session[:user_id] = nil
				session[:user_name] = nil
				redirect_to(:action => "login_page")
		end

end
