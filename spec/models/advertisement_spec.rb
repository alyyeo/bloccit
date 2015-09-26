require 'rails_helper'

RSpec.describe Advertisement, type: :model do
    let(:ad) { Advertisement.create!(title: "New Ad Title", copy: "New Ad Copy", price: 0)}
    
    describe "attributes" do
        it "should respond to title" do
            expect(ad).to respond_to(:title)
        end
        
        it "should respond to copy" do
            expect(ad).to respond_to(:copy)
        end
        
        it "should respond to price" do
            expect(ad).to respond_to(:price)
        end
        
        it "should have price be an integer" do
            expect(ad.price).to be_a Integer
        end
    end
end
