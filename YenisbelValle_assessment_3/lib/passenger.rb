class Passenger

    def initialize(name)
        @name = name
        @flight_numbers = []

    end

    def name
        @name
    end

    def has_flight?(str)
        @flight_numbers.include?(str) || @flight_numbers.include?(str.upcase)
    end


    def add_flight(str)
        if (self.has_flight?(str) == false)
            upcased = str.upcase
            @flight_numbers << upcased
        end

    end
end