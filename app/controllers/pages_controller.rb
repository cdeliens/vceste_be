class PagesController < InheritedResources::Base
  def index
    index! do |format|
      if params[:callback]
        format.json { render :json => collection.to_json, :include => :category, :callback => params[:callback] }
      else
        format.json { render json: collection.to_json}
       end
    end
    
  end

  def show
    show! do |format|
      if params[:callback]
        format.json { render :json => resource.to_json, :include => :category, :callback => params[:callback] }
      else
        format.json { render json: resource.to_json}
       end
    end
    
  end

  def find_by_category
    category = Category.find_by_name(params[:id].capitalize)
    @results = Page.where(category_id: category.id)
    respond_to do |format|
      if params[:callback]
        format.json { render :json => @results.to_json, :include => :category, :callback => params[:callback] }
      else
        format.json { render json: @results.to_json}
       end
    end
  end


end