class ScreamsController < ApplicationController

  def show
    @results = Scream.all_content_providers params[:id]
    respond_to do |format|
      if params[:callback]
        format.json { render :json => @results.to_json, :callback => params[:callback] }
      else
        format.json { render json: @results.to_json}
      end
    end
  end 
end