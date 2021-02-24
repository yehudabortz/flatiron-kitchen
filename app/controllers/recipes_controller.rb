class RecipesController < ApplicationController
    def new
        @recipe = Recipe.new
        @recipe.ingredients.build(name: "asdasd")

    end

    def create
        recipe = Recipe.create(recipe_params)
        redirect_to recipe
    end
    
    def edit
        @recipe = Recipe.find_by(id: params[:id])
    end
    
    def update
        recipe = Recipe.update(recipe_params)
        redirect_to recipe_path(recipe)
    end
    
    def show
        @recipe = Recipe.find_by(id: params[:id])
    end

    def index
    end

    private

    def recipe_params

        params.require(:recipe).permit(:name, ingredient_attributes: [:name], ingredient_ids:[])
    end
end
