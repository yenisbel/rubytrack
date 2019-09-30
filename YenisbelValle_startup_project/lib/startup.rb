require "employee"

class Startup

    attr_reader :name, :funding 
    attr_accessor :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
        self.funding > startup.funding

    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise 'An error has occured.' 
        end
    end

    def size
        employees.length
    end

    def pay_employee(employee)
        if @funding > @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else
            raise 'An error has ocurred'
        end
    end

    def payday
        @employees.each do |name|
            pay_employee(name)
        end
    end

    def average_salary
        suma = 0
        @employees.each do |employee|
            suma += salaries[employee.title]
        end
        suma / size
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |k,v|
            if ! @salaries.has_key?(k)
                @salaries[k] = v
            end
        end
        startup.employees.each do |ele|
            @employees << ele
        end
        startup.close

    end

end
