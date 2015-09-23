class Post < ActiveRecord::Base
    has_many :comments
    
    def censor
        return "CENSORED"
    end
end
