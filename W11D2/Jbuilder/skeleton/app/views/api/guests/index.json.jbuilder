#DO NOT DO THIS IN FULLSTACK
json.array! @guests do |guest| # don't do this for fullstacks!!!!! don't use json.array!
    json.partial! "guest", guest: guest
end 
# THIS IS MARGINALLY BETTER
# @guests.each_with_index do |guest,idx|
#     json.set! idx do
#         json.extract! guest, :id, :name, :age, :favorite_color
#     end
# end
