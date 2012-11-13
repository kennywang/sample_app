require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    #before { visit root_path }
		before { visit '/' }

    it { should have_selector('h1',    text: 'Sample App') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1',    text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1',    text: 'Contact') }
    it { should have_selector('title', text: full_title('Contact')) }
  end

	describe "when email format is invalid" do
	  it "should be invalid" do
	    addresses = %w[user@foo,com user_at_foo.org example.user@foo.
	                     foo@bar_baz.com foo@bar+baz.com]
	    addresses.each do |invalid_address|
	        @user.email = invalid_address
	        @user.should_not be_valid
	    end      
	  end
	end

	describe "when email format is valid" do
	  it "should be valid" do
	    addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
	    addresses.each do |valid_address|
	        @user.email = valid_address
	        @user.should be_valid
	    end      
	  end
	end
end