# frozen_string_literal: true

class PostBlueprint < Blueprinter::Base

    identifier :id
     association :comments, blueprint: CommentBlueprint,view: :normal
    view :normal do
       fields :title, :body, :likes
          

     end
     
end
