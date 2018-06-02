require 'rails_helper'

describe DiscussionsController, :type => :controller do
  describe "GET #index" do
    it "populates an array of discussions" do
      discussion = FactoryBot.create(:discussion)
      get :index
      assigns(:discussions).should include(discussion)
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end
  
  describe "GET #show" do
    it "assigns the requested discussions to @discussion" do
      discussion = FactoryBot.create(:discussion)
      get :show, id: discussion
      assigns(:discussion).should eq(discussion)
    end
    it "renders the :show template"
  end
  
  describe "GET #new" do
    it "assigns a new Discussion to @discussion"
    it "renders the :new template"
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new discussion in the database"
      it "redirects to the home page"
    end
    
    context "with invalid attributes" do
      it "does not save the new discussion in the database"
      it "re-renders the :new template"
    end
  end
end