require 'spec_helper'

describe Admin::PanelistsController do

  describe "GET 'index'" do
    before do
      get 'index'
    end

    it{ assigns(:panelists).should == Panelist.find(:all) }
    it{ response.should be_success }
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      post 'create'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      put 'edit'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      delete 'edit'
      response.should be_success
    end
  end
end
