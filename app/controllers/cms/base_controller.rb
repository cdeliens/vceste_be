class Cms::BaseController < ApplicationController
  respond_to :html, :json
  layout "cms"
  before_filter :require_http_auth_on_staging
  before_filter :default_attributes 
  before_filter :sanitize_model_name


  inherit_resources
  # has_scope :page,     default:  1

  has_scope :q do |controller, scope|
    scope.search(controller.params[:q] || "")
  end


  def create
    create!(:notice => "#{@instance_name.humanize} succesfully created" ) {send("cms_#{@collection_name}_path")}
  end
  

  def update
    update!(:notice => "#{@instance_name.humanize} succesfully updated" ) { send("edit_cms_#{@instance_name}_path", params[:id]) }
  end

  def destroy
    destroy!(:notice => "#{@instance_name.humanize} succesfully removed" ) { send("cms_#{@collection_name}_path") }
  end


  private
  
    def sanitize_model_name
      @collection_name = @model.name.underscore.gsub("/","_").downcase.pluralize
      @instance_name = @model.name.underscore.gsub("/","_").downcase
    end
    
    def attributes_types_from(model)
      attributes = []
      @model.columns_hash.each do |k,v| 
        attributes.tap do |attr|
          
          if k == 'body'
            
            attr << {name: k, type: v.type, class: 'redactor', as: :text}
          else
            attr << {name: k, type: v.type}
          end
        end
      end
      return attributes
    end
    def default_attributes
      @model = resource_class
      @attributes_hash = attributes_types_from @model
    end
end