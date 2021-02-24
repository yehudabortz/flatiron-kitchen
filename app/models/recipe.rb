class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    validates :name, presence: true

    accepts_nested_attributes_for :ingredients

    def ingredient_attributes=(ingredient)
        self.ingredients << Ingredient.find_or_create_by(name: ingredient[:name])
        self.save
    end
end
