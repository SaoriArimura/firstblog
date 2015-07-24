require 'spec_helper'

describe PostsController do
  login_user
 
  describe "POST #create" do
    context "with vald attributes" do
      it "saves the new post in the database" do
        expect{
          post :create, post: attributes_for(:post)
        }.to change(Post, :count).by(1)
      end
      it "redirects to posts#show" do
        post :create, post: attributes_for(:post)
        expect(response).to redirect_to post_path(assigns[:post])
      end
    end

    context "with invalid attributes" do
      it "does not save the new post in the databaes" do
        expect{
          post :create, post: attributes_for(:invalid_post)
        }.to_not change(Post, :count)
      end
      it "re-rendrs the :new template" do
        post :create,
          post: attributes_for(:invalid_post)
        expect(response).to render_template :new
      end
    end
  end



  describe 'GET #index' do
    it "populates an array of all posts" do
      post = create(:post)
      get :index
      expect(assigns(:posts)).to eq([post])
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "assigns the requested post to @post" do
      post = create(:post)
      get :show, id: post
      expect(assigns(:post)).to eq post
    end
    it "renders the :new template" do
      post = create(:post)
      get :show, id:post
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it "assigns the requested post to @post" do
      post = create(:post)
      get :edit, id: post
      expect(assigns(:post)).to eq post
    end
    it "renders the :edit template" do
      post = create(:post)
      get :edit, id: post
      expect(response).to render_template :edit
    end
  end

  describe 'GET #new' do
    it "assigns a new Post to @post" do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "PATCH #update" do

    before :each do 
      @post = create(:post)
    end

    context "with vald attributes" do
      it "locates the required @post" do
        patch :update, id: @post, post: attributes_for(:post)
        expect(assigns(:post)).to eq(@post)
      end
      it "changes @post's attributes" do
        patch :update, id: @post, 
          post: attributes_for(:post, review: 'uuuuuu')
        @post.reload
        expect(@post.review).to eq("uuuuuu")
      end
      it "redirects to the updated post" do
        patch :update, id: @post, post: attributes_for(:post)
        expect(response).to redirect_to @post
      end
    end

    context "with invalid attributes" do
      it "does not update the post" do
        patch :update, id: @post,
          post:attributes_for(:post, review: nil)
        @post.reload
        expect(@post.review).to eq("text")  
      end
      it "re-rendrs the :edit template" do
        patch :update, id: @post,
        post: attributes_for(:invalid_post)
        expect(response).to render_template :edit
      end
    end
  end



  describe 'DELETE #destroy' do

    before :each do 
      @post = create(:post)
    end

    it "deletes the post from the database" do
      expect{
        delete :destroy, id: @post
      }.to change(Post, :count).by(-1)
    end

    it "redirects to posts#index" do
      delete :destroy, id: @post
      expect(response).to redirect_to posts_url
    end
  end
end


