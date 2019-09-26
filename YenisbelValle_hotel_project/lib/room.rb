class Room
    # room = { Room.new(3) }

    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        return self.occupants.length == self.capacity   
    end

    def available_space
        return self.capacity - self.occupants.length
    end

    def add_occupant(name)
        if self.full?
            return false
        else
            @occupants << name
            return true
        end
    end

end
