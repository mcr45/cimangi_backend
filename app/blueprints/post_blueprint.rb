# frozen_string_literal: true

class PostBlueprint < Blueprinter::Base

    identifier :id
     association :comments, blueprint: CommentBlueprint,view: :normal
     association :user , blueprint: UserBlueprint, view: :author, name: :author
    view :normal do
       fields :title, :body, :likes
          

     end
     
end
