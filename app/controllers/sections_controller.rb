class SectionsController < ApplicationController

	 def index
	 	section_list
	 	render(:action => 'section_list')
	 end

	 def section_list
	 	@subject = Subject.find(params[:id])
	 	@page = Page.find(params[:page_id])
	 	@section = @page.sections.order("sections.position ASC")
	 end

	 def section_details
	 	@subject = Subject.find(params[:id])
	 	@page = Page.find(params[:page_id])
	 	@section = Section.find(params[:section_id])
	 end

	 def new_section
	 	@subject = Subject.find(params[:id])
	 	@page = Page.find(params[:page_id])
	 	@section = Section.new()
	 end

	 def create_section
	 	@subject = Subject.find(params[:id])
	 	@page = Page.find(params[:page_id])
	 	@section = Section.new(params[:section].permit(:name, :position, :visible, :content, :content_type))

	 	@page.sections << @section
	 	if(@section.save)
	 		flash[:notice] = "Section created"
	 		redirect_to(:id => @subject.id, :page_id => @page.id, :action => 'section_list')
	 	else
	 		render(:action => 'new_section')
	 	end
	 end
end
