require_relative "room"

class Hotel
    def initialize(name, capacities)
        @name = name
        @rooms = {}

        capacities.each do |rname, value|
            @rooms[rname] = Room.new(value)
        end
    end

    def rooms
        @rooms
    end

    def name
        capitalized = @name.split(' ').map {|word| word.capitalize}
        capitalized.join(' ')
    end

    def room_exists?(name_room)
        return self.rooms.keys.include?(name_room)
        # @rooms.has_key?(name_room)
    end

    def check_in(person, rname)
        if self.room_exists?(rname)     
            if @rooms[rname].add_occupant(person)
                p 'check in successful'
            else
                p 'sorry, room is full'
            end
        else
            p 'sorry, room does not exist'
        end
    end

    def has_vacancy?
        @rooms.values.any?{|type_room| type_room.available_space > 0}
    end

    def list_rooms
        @rooms.each do |rname, room|
            p "#{rname} : #{room.available_space}"
        end
    end

  
end
