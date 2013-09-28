module ApplicationHelper
  
  def index_header(collection_name, instance_name)
    content_tag :div,(content_tag(:h1, collection_name.humanize) + content_tag(:a, content_tag(:i, "", class: "icon-plus icon-white") + "Add new #{instance_name.humanize}", href: send("new_cms_#{instance_name}_path"), class: "btn btn-success new")), class: "cms_index_header"
  end

  def index_table_head(model)
    content = [].tap do |th|
      model.attribute_names[0..4].each do |attr|
        th <<  content_tag(:th, attr)
     end
       th <<  content_tag(:th, "Actions")
    end
    content_tag :tr, content.join.html_safe
  end
  
  def simple_form_builder(form, attributes_hash)
    form_build = []
    attributes_hash = exclude_attributes attributes_hash
    attributes_hash.each do |attr|
      if is_nested_attribute? attr[:name]
        form_build << (form.input attr[:name], collection: Hash[attr[:name][0..-4].capitalize.constantize.all.map{|e| [e.name, e.id]}] , label: attr[:name].capitalize, as: :select)
      else
        if attr[:as]
          form_build << (form.input attr[:name], as: attr[:as], label: attr[:name].capitalize)
        elsif attr[:class]
          form_build << (form.input attr[:name], label: attr[:name].capitalize, html_input: {class: attr[:class]}, as: attr[:as])
        else
          form_build << (form.input attr[:name], label: attr[:name].capitalize )
        end
      end
    end
    form_build.join.html_safe
  end

  def exclude_attributes(attributes)
    black_list = %w(id created_at updated_at)
    clean_attributes = []
    attributes.each do |attr|
      if !(black_list.include? attr[:name])
        clean_attributes << attr
      end
    
    end
    clean_attributes
  end

  def print_attribute(instance, attribute)
    begin
      if is_nested_attribute? attribute
        instance.send(attribute[0..-4]).name
      else
        instance.send(attribute)
      end
      rescue => e
        logger.warn "Unable to print attribute: #{e}" 
      end
  end

  private
  def is_nested_attribute? attributes
    attributes[-3,3] == "_id"
  end

end
