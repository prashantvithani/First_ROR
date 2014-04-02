
class PagesController < ApplicationController 

	def index
		page_list		
		render(:action => 'page_list')		
	end

	def page_list

		# subid = params[:subject][:id].reject(&:blank?) unless params[:subject].nil?
			
		# end
		@subject = Subject.find(params[:id])
		@pages = @subject.pages.order("pages.position ASC")
	end

	def show_details
		@subject = Subject.find(params[:id])
		@page = Page.find(params[:page_id])
	end

	def new_page
		@subject = Subject.find(params[:id])
		@page = Page.new()
	end

	def create_page
		@subject = Subject.find(params[:id])
		@page = Page.new(params[:page].permit(:name, :position, :visible, :id))
		@subject.pages << @page
		if(@page.save)
			flash[:notice] = "Page created"
			redirect_to(:id => @subject.id, :action => 'page_list')
		else
			render(:action => 'new_page')
		end
	end

	def edit_page
		@subject = Subject.find(params[:id])
		@page = Page.find(params[:page_id])
	end

	def update_page
		@subject = Subject.find(params[:id])
		@page = Page.find(params[:page_id])
		
		if(@page.update_attributes(params[:page].permit(:id, :name, :position, :visible)))
			flash[:notice] = "Page Updated"
			redirect_to(:id => @subject.id, :action => 'page_list')
		else
			render(:action => 'edit_page')
		end
	end

	def delete_page
		@subject = Subject.find(params[:id])
		@page = Page.find(params[:page_id])
	end

	def destroy_page
		@subject = Subject.find(params[:id])
		@page = Page.find(params[:page_id])
		@subject.pages.delete(@page)

		flash[:notice] = "Page Deleted"
		redirect_to(:id => @subject.id, :action => 'page_list')
	end

end
