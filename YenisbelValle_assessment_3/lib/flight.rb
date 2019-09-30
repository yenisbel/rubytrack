require_relative "passenger"


class Flight

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def passengers
        @passengers
    end

    def full?
        self.passengers.length == @capacity
    end

    def board_passenger(passenger)
        if passenger.has_flight?(@flight_number) && self.full? == false
            self.passengers << passenger
        end
    end

    def list_passengers
        names = []
        @passengers.each do |passenger|
            names << passenger.name
        end
        names
       
    end

    def [](idx)
        self.passengers[idx]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end


end