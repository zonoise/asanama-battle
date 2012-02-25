require 'spec_helper'

describe PanelistsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'good'" do
    it "returns http success" do
      get 'good'
      response.should be_success
    end
  end

  describe "GET 'bad'" do
    it "returns http success" do
      get 'bad'
      response.should be_success
    end
  end

  describe "GET 'point'" do
    it "returns http success" do
      get 'point'
      response.should be_success
    end
  end

end
