require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show" do

    # 7.3.1 Testing user show page with factories p.248
    before(:each) do
      # in users_controller, we have: @user = User.find(params[:id])
      # so in test we need a @user instance variable
      @user = Factory(:user)
    end

    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    # assigns(:user) is a facility provided by RSpec. The assigns method
    # takes a symbol argument and returns the value of the corresponding 
    # instance variable in the controller action.
    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end

    it "should have the right title" do
      get :show, :id => @user
      response.should have_selector("title", :content => @user.name)
    end

    it "should include the user's name" do
      get :show, :id => @user
      response.should have_selector("h1", :content => @user.name)
    end

    it "should have a profile image" do
      get :show, :id => @user
      response.should have_selector("h1>img", :class => "gravatar")
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "Sign up")
    end
  end

end
