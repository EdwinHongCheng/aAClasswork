@guests.each do |guest|
    json.set! guest.id do
        json.extract! guest, :id, :name, :age, :favorite_color
    end
end
