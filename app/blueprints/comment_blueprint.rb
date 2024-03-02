# frozen_string_literal: true

class CommentBlueprint < Blueprinter::Base
    fields :body
    association :user, blueprinter: UserBlueprint, view: normal
    association :post, blueprinter: PostBlueprint, view: normal
end
