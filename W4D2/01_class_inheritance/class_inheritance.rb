class Employee
    attr_reader :salary
    
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss

        if @boss != nil
            @boss.assigned_employees << self
        end
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end
end


class Manager < Employee
    attr_accessor :assigned_employees

    def initialize(name, title, salary, boss)
        super
        @assigned_employees = []
    end

    def bonus(multiplier)
        total = 0
        queue = []
        queue += @assigned_employees
        while !queue.empty?
            current_employee = queue.shift
            total += current_employee.salary
            if current_employee.is_a?(Manager)
                queue += current_employee.assigned_employees
            end
        end
        manager_bonus = total * multiplier
    end
end

# Examples
ned = Manager.new("Ned", "founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
