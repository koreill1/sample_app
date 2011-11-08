# To change this template, choose Tools | Templates
# and open the template in the editor.

#require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'spec_helper'

describe "Layoutlinks" do

  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    response.should have_selector('title', :content => "About")
    click_link "Help"
    response.should have_selector('title', :content => "Help")
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")
    click_link "Home"
    response.should have_selector('title', :content => "Home")
    click_link "Sign Up Now!"
    response.should have_selector('title', :content => "Sign up")
  end
end

