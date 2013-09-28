class EventsController < InheritedResources::Base
  def index
    @results = Event.all()
    respond_to do |format|
      if params[:callback]
        format.json { render :json => @results.to_json(include: :place), :callback => params[:callback] }
      else
        format.json { render json: @results.to_json(include: :place)}
      end
    end
  end 

  def show
    @results = Event.find_by_id params[:id]
    respond_to do |format|
      if params[:callback]

        format.json { render :json => @results.to_json(include: :place), :callback => params[:callback]  }
      else
        format.json { render json: @results.to_json(include: :place)}
      end
    end
  end 
  
end
