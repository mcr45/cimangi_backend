# frozen_string_literal: true

class RecipeBlueprint < Blueprinter::Base
    identifier:id

    association :comments, blueprint: CommentBlueprint,view: :normal
    association :user , blueprint: UserBlueprint, view: :author, name: :author
    view :normal do
        fields :title, :body, :category
    end
end
