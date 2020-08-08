# frozen_string_literal: true

class Admin::PostsController < ApplicationController
	before_action :find_post, only: %i[show  edit update destroy view_count]
	def index
		@posts = Post.all.page(params[:page])
	end

 	def new
 		@post = Post.new
 		@categories = Category.all
 		
 	end

 	def create
 		@post = Post.new(post_params)
 		if @post.save
 			flash[:success] = t('admin.posts.create.success')
 			redirect_to admin_post_path(@post)
 		else
 			flash[:danger] = t('admin.posts.errors')
 			render 'new'
 		end		
 	end

 	def edit
 		@categories = Category.all
 	end

 	def update

 		if @post.update(post_params)
 			flash[:success] = t('admin.posts.update')
 			redirect_to admin_post_path(@post)
 		else
 			render 'edit'
 		end	
 	end

 	def destroy
 		@post.destroy
 		redirect_to admin_posts_path
 	end

 	def view_count
 		if @post.post_view.present?
 			@count = @post.post_view
 			@view = @count.view_count + 1
 			@count.update_attributes(view_count: @view )
 			redirect_to admin_post_path(@post)
 		else
 			@post_view = @post.create_post_view(view_count: 1)

 			if @post_view.save
 				redirect_to admin_post_path(@post)
 			end	
 		end	

 	end

 	def search
 		if params[:q].present?
 			@posts = Post.where('title LIKE ?','%' + params[:q] +'%')
 		end	
 		# if params[:q].length < 3
 		# redirect_to admin_posts_path
 		# end	
 		if params[:q] == ''
 			redirect_to admin_posts_path
 		end
 	end

 	private
 		def find_post
 			@post = Post.find(params[:id])
 		end

 		def post_params
 			params.require(:post).permit(:title, :body, :image, :category_ids)
 		end
end
