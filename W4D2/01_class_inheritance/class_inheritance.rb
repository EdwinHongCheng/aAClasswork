class Employee
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

    def initialize

        @assigned_employees = []
    end

    def bonus
        # manager's bonus = (all assigned_employees' bonuses) * multiplier
    end
end

# Examples
ned = Manager.new("Ned", "founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
