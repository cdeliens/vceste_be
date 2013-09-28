class TagsController < ApplicationController
  def index
    @results = Tag.all()
    respond_to do |format|
      if params[:callback]
        format.json { render :json => @results.to_json, :callback => params[:callback] }
      else
        format.json { render json: @results.to_json}
      end
    end
  end 
end
