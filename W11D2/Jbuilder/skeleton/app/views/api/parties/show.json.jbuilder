json.partial! "party", party: @party

json.guests do
 
  json.array! @party.guests   do |guest|
    json.extract!     guest, :id, :name, :age, :favorite_color

    json.gifts do 
      json.array! guest.gifts do |gift|
        json.extract! gift,  :title, :description
      end
    end

  end # end @party.guests array!

end #end json.guests
