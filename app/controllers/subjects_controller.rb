class SubjectsController < ApplicationController
	def index
		list
		render('list')
	end
	def list
		@subjects = Subject.order("subjects.position ASC")
	end

	def show
		# @id = Subject.id
		@subject = Subject.find(params[:id])
	end

	def new
		@subject = Subject.new
	end

	def create
		#creating new subject
		@subject = Subject.new(params[:subject].permit(:name, :position, :visible))
		#saving subject
		if @subject.save
			#if subject success
			flash[:notice] = "Subject created"
			redirect_to(:action => 'list')
		else
			#if subject fails
			render(:action => 'new')
		end
	end

	def edit
		@subject = Subject.find(params[:id])
	end

	def update
		#find and updating subject
		@subject = Subject.find(params[:id])
		# @subject = Subject.new(params[:subject].permit(:id, :name, :position, :visible))
		#saving subject
		if @subject.update_attributes(params[:subject].permit(:id, :name, :position, :visible))
			#if subject success
			flash[:notice] = "Subject edited"
			redirect_to(:action => 'show', :id => @subject.id)
		else
			#if subject fails
			render(:action => 'edit')
		end
	end

	def delete
		@subject = Subject.find(params[:id])
	end

	def destroy
		Subject.find(params[:id]).destroy
		flash[:notice] = "Subject deleted"
		redirect_to(:action => 'list')
	end
end
