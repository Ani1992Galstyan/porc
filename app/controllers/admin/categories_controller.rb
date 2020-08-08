# frozen_string_literal: true
class Admin::CategoriesController < ApplicationController
	before_action :find_category, only: %i[show  edit update destroy]
	def index
		@categories = Category.all
	end

	def show
		
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save 
			redirect_to admin_category_path(@category)
		else
			render 'new'
		end	
	end

	private

	def find_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:title)
	end
end
