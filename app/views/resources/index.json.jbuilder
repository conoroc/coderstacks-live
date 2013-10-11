json.array!(@resources) do |resource|
  json.extract! resource, :title, :description, :category_id, :type, :source, :level, :year
  json.url resource_url(resource, format: :json)
end
