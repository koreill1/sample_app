# To change this template, choose Tools | Templates
# and open the template in the editor.

#require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'spec_helper'

describe "Layoutlinks" do

  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
end

