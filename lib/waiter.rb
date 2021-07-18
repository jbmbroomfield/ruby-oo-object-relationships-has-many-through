class Waiter
    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.filter do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        meals.max { |meal_a, meal_b| meal_a.tip <=> meal_b.tip }.customer
    end

    def self.all
        @@all
    end
end