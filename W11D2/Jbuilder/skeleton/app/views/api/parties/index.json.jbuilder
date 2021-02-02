# seriously don't do this for fullstack :( (O(N) arrays)
json.array! @parties do |party|
  json.partial! "party", party: party
end