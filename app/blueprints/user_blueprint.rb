# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id
    
    view :normal do
        fields :username, :email, :first_name, :last_name
        association :posts, blueprint: PostBlueprint, view: :normal
       
    end
    view :author do
        fields :username
    end
    view :restricted do
        fields :username
    end
   
end
