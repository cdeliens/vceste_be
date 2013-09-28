class TwitterServicesController < ApplicationController

  def show
    @results = TC.search("##{params[:id]}", :count => 20, :result_type => "recent", include_entities: true).results
    respond_to do |format|
      if params[:callback]
        format.json { render :json => @results, :callback => params[:callback] }
      else
        format.json { render json: @results}
      end
    end
  end
    
end
