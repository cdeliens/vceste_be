class InstagramServicesController < ApplicationController
  def show
    @results = Instagram.tag_recent_media(params[:id])
    respond_to do |format|
      if params[:callback]
        format.json { render :json => @results.to_json, :callback => params[:callback] }
      else
        format.json { render json: @results}
      end
    end
  end


end
