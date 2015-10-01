require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
    let(:my_user) { User.create!(name: "Blochead", email: "blochead@bloc.io", password: "password") }
    
    describe "GET new" do
        it "returns http success" do
            get :new
            expect(response).to have_http_status(:success)
        end
    end
    
    describe "POST sessions" do
        it "returns http success" do
            post :create, session: {email: my_user.email}
            expect(response).to have_http_status(:success)
        end
        
        it "initializes a session" do
            post :create, session: {email: my_user.email, password: my_user.password}
            expect(assigns(:session)) == my_user.id
        end
        
        it "does not initialize session due to missing password" do
            post :create, session: {email: my_user.email}
            expect(assigns(:session)).to be_nil
        end
        
        it "flashes error with a bad email" do
            post :create, session: {email: "does not exist"}
            expect(flash[:error]).to be_present
        end
        
        it "renders #new with bad email address" do
            post :create, session: {email: "does not exist"}
            expect(response).to render_template :new
        end
        
        it "renders #show view with valid email address" do
            post :create, session: {email: my_user.email}
            expect(response).to render_template :new
        end
    end
    
    describe "DELETE session/id" do
        it "render the #welcome view" do
            delete :destroy, id: my_user.id
            expect(response).to redirect_to root_path
        end
        
        it "deletes the user session" do
            delete :destroy, id: my_user.id
            expect(assigns(:session)).to be_nil
        end
        
        it "flashes #notice" do
            delete :destroy, id: my_user.id
            expect(flash[:notice]).to be_present
        end
    end
end
