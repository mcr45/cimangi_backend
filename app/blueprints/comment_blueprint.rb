# frozen_string_literal: true

class CommentBlueprint < Blueprinter::Base
    fields :body
    view :normal do
        fields :body
        association :user, blueprint: UserBlueprint, view: :restricted
    #association :post, blueprint: PostBlueprint, view: normal
    end
    
end
