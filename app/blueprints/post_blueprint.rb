# frozen_string_literal: true

class PostBlueprint < Blueprinter::Base

    identifier :id
    fields :title, :body, :likes
    view :normal do
       association :user, blueprinter: UserBlueprint, view: :normal
       association :comment, blueprinter: CommentBlueprint, view: :normal
    end
end
