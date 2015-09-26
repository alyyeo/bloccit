class Advertisement < ActiveRecord::Base

    def generate_price
        return rand(1..100)
    end

end
