require 'rails_helper'

RSpec.describe Question, type: :model do
    let(:question) { Question.create!(title: "New Question Title", body: "New Question Body", resolved: false)}
    
    describe "attributes" do
        it "should respond to title" do
            expect(question).to respond_to(:title)
        end
        
        it "should respond to body" do
            expect(question).to respond_to(:body)
        end
        
        it "should respond to resolved" do
            expect(question).to respond_to(:resolved)
        end
        
        it "default for resolved is false" do
            expect(question.resolved).to be_falsey
        end
    end
end
