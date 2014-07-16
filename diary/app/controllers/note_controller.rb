class NoteController < ApplicationController

		#自定义的layout
		layout "myself_layout"

		#操作拦截器
		#如果没有登录不能操作
		#login_user_filter 定义在父类里
		before_filter :login_user_filter


		def index
				@notes = Note.order("notes.id desc")
		end

		def detail
				@note = Note.find(params[:id])
		end
		
		def new
				@note = Note.new
		end
	
		# 创建日记	
		def create
				note_new = Note.new(params[:note])
				if note_new.save
						flash[:notice] = "add success!"
						redirect_to(:action => "index")
				else
						render("new")
				end
		end

		def update
				@note = Note.find(params[:id])
		end

		#更新日记
		def change
				@note = Note.find(params[:id])
				if @note.update_attributes(params[:note])
						flash[:notice] = "update success!"
						redirect_to(:action => "index")
				else
						render("update")
				end
		end

		#删除日记
		def delete
				@note = Note.find(params[:id])
				if @note
						@note.destroy
						render :json => {:tips => 1}
				else
						render :json => {:tips => 2}
				end
		end
end
