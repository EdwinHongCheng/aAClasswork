# AGAIN DO NOT USE .ARRAY IN FULLSTACK O(N) ADDITION!!!
json.array! @gifts do |gift|
  json.extract! gift, :title, :description
end