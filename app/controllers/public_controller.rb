class PublicController < ApplicationController
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.all.find{|subject| subject.slug == params[:id]}
    @pages = @subject.pages
  end
end
