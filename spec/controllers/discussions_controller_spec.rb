require 'rails_helper'

describe DiscussionsController, :type => :controller do
  describe "GET #index" do
    it "populates an array of discussions" do
      discussion = FactoryBot.create(:discussion)
      get :index
      expect(assigns(:discussions)).to include(discussion)
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe "GET #show" do
    it "assigns the requested discussion to @discussion" do
      discussion = FactoryBot.create(:discussion)
      get :show, id: discussion
      expect(assigns(:discussion)).to eq(discussion)
    end
    it "renders the :show template" do
      get :show, id: FactoryBot.create(:discussion)
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    context "is a logged in user" do
      before do
        @user = FactoryBot.create(:admin)
        sign_in @user
      end
      it "returns discussion's new page" do
        get :new
        expect(response).to render_template :new
      end
    end
    context "is neither admin nor logged in user" do
      it "returns discussion's new page" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  
  describe "POST #create" do
    before :each do
      @user = FactoryBot.create(:admin)
      sign_in @user
    end

    context "is admin" do
      context "with valid attributes" do
        it "saves the new discussion in the database" do
          expect {
            post :create, discussion: FactoryBot.attributes_for(:discussion)
          }.to change(Discussion, :count).by(1)
        end
        it "redirects to the new discussion" do
          post :create, discussion: FactoryBot.attributes_for(:discussion)
          expect(response).to redirect_to Discussion.last
        end
      end
      
      context "with invalid attributes" do
        it "does not save the new discussion in the database" do
          expect {
            post :create, discussion: FactoryBot.attributes_for(:invalid_discussion)
          }.to_not change(Discussion, :count)
        end
        it "re-renders the :new template" do 
          post :create, discussion: FactoryBot.attributes_for(:invalid_discussion)
          expect(response).to render_template :new
        end
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @user = FactoryBot.create(:admin)
      sign_in @user
      @discussion = FactoryBot.create(:discussion)
    end
    
    context "is admin or owner" do
      context "valid attributes" do
        it "located the requested discussion" do
          put :update, id: @discussion, discussion: FactoryBot.attributes_for(:discussion)
          expect(assigns(:discussion)).to eq(@discussion)      
        end
      
        it "changes @discussion's attributes" do
          put :update, id: @discussion, discussion: FactoryBot.attributes_for(:discussion, title: "Another_title")
          @discussion.reload
          expect(@discussion.title).to eq("Another_title")
        end
      
        it "redirects to the updated discussion" do
          put :update, id: @discussion, discussion: FactoryBot.attributes_for(:discussion)
          expect(response).to redirect_to @discussion
        end
      end
      
      context "invalid attributes" do
        it "locates the requested @discussion" do
          put :update, id: @discussion, discussion: FactoryBot.attributes_for(:invalid_discussion)
          expect(assigns(:discussion)).to eq(@discussion)      
        end
        
        it "does not change @discussion's attributes" do
          put :update, id: @discussion, 
            discussion: FactoryBot.attributes_for(:discussion, title: "T")
          @discussion.reload
          expect(@discussion.title).not_to eq("T")
        end
        
        it "re-renders the edit method" do
          put :update, id: @discussion, discussion: FactoryBot.attributes_for(:invalid_discussion)
          expect(response).to redirect_to(edit_discussion_path(@discussion))
        end
      end
    end

    context "is neither admin nor owner" do
      before do
        sign_out(@user)
        @user = FactoryBot.create(:user)
        sign_in(@user)
      end
      it "redirects to discussions#index" do
        put :update, id: @discussion, discussion: FactoryBot.attributes_for(:discussion)
        expect(response).to redirect_to(discussion_path(@discussion))
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @user = FactoryBot.create(:admin)
      sign_in @user
      @discussion = FactoryBot.create(:discussion)
    end

    context "is owner or admin" do
      it "deletes the discussion" do
        expect{
          delete :destroy, id: @discussion        
        }.to change(Discussion, :count).by(-1)
      end

      it "redirects to discussions#index" do
        delete :destroy, id: @discussion
        expect(response).to redirect_to(discussions_path)
      end
    end
      
    context "is neither admin nor owner" do
      before do
        @user.admin = false
        @user.reload
        sign_in(@user)
      end
      it "redirects to discussions#index" do
          delete :destroy, id: @discussion
          expect(response).to redirect_to(discussions_path)
      end
    end
  end
end