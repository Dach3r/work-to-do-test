module SerializerHelper
  def response_json_data(resource, params = {})
    if params.nil?
      resource
    else
      model = resource.klass
      attrs_validated = model.new.attributes.keys & params
      model.all.select(attrs_validated)
    end
  end
end
