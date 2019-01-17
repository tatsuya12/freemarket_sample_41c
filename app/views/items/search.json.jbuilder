json.array! @items do |item|
  json.id item.id
  json.name item.title
  json.image image.image
end
