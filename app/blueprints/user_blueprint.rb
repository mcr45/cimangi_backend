# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :username, :email, :first_name
    end
    view :posts do
        association :posts, blueprinter: PostBluePrint
    end
    view :recipes do
        association :recipes, blueprinter: RecipeBluePrint
    end
end
