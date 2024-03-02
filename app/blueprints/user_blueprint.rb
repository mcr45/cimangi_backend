# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id
    #association :posts, blueprint: PostBlueprint, view: :normal
    view :normal do
        fields :username, :email, :first_name
        association :posts, blueprint: PostBlueprint, view: :normal
       #  association :post, blueprint: PostBluePrint, view: :normal
    end
    view :restricted do
        fields :username
    end
    #view :posts do
       # association :posts, blueprint: PostBluePrint, view: :normal
    #end
   # view :recipes do
    #    association :recipes, blueprint: RecipeBluePrint, view: :normal
    #end
end
