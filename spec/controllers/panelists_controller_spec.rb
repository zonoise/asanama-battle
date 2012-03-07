require 'spec_helper'

describe PanelistsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'good'" do
    it "returns http success" do
      post 'good'
      response.should be_success
    end
  end

  describe "GET 'bad'" do
    it "returns http success" do
      post 'bad'
      response.should be_success
    end
  end

  describe "GET 'point'" do
    it "returns http success" do
      get 'point'
      response.should be_success
    end
  end

  describe "GET score" do
    it "return good  and bad and point" do
      pending
    end
  end
end
