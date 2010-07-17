require "spec_helper"

describe Mongoid::Atomic do
  
  context "user" do
    
    before(:each) do
      @bob = User.create(:username => 'Bob', :groups => %w[users moderators admins])
      @nancy = User.create(:username => 'Nancy', :groups => %w[users peons])
    end
    
    it "should increment" do
      @bob.atomic_inc :post_count
      @bob.reload.post_count.should eql 1
      @bob.atomic_inc :post_count
      @bob.reload.post_count.should eql 2
      @bob.atomic_inc :post_count, -2
      @bob.reload.post_count.should eql 0
      @nancy.atomic_inc :post_count, 10
      @nancy.reload.post_count.should eql 10
    end
    
    it "should set" do
      @bob.atomic_set :username, 'Robby'
      @bob.reload.username.should eql 'Robby'
      @nancy.atomic_set :groups, %w[users women]
      @nancy.reload.groups.should eql %w[users women]
    end
    
    it "should unset" do
      @bob.atomic_unset :groups
      @bob.reload.groups.should eql nil
    end
    
    it "should push" do
      @bob.atomic_push :groups, 'bobs'
      @bob.reload.groups.should eql %w[users moderators admins bobs]
      @nancy.atomic_unset :groups
      @nancy.atomic_push :groups, 'women'
      @nancy.atomic_push :groups, 'nancies'
      @nancy.reload.groups.should eql %w[women nancies]
    end
    
    it "should push all" do
      @bob.atomic_push_all :groups, %w[executives bosses idiots]
      @bob.reload.groups.should eql %w[users moderators admins executives bosses idiots]
    end
    
    it "should add to set" do
      @bob.atomic_add_to_set :groups, 'bobs'
      @bob.reload.groups.should eql %w[users moderators admins bobs]
      @bob.atomic_add_to_set :groups, 'users'
      @bob.reload.groups.should eql %w[users moderators admins bobs]
    end
    
    it "should pop" do
      @bob.atomic_pop :groups
      @bob.reload.groups.should eql %w[users moderators]
      @bob.atomic_pop :groups, -1
      @bob.reload.groups.should eql %w[moderators]
      @nancy.atomic_pop :groups, 1
      @nancy.reload.groups.should eql %w[users]
      @nancy.atomic_set :groups, %w[beautiful brunette woman starts_with_n]
      @nancy.atomic_pop :groups, 1
      @nancy.reload.groups.should eql %w[beautiful brunette woman]
    end
    
    it "should pull" do
      @bob.atomic_pull :groups, 'users'
      @bob.reload.groups.should eql %w[moderators admins]
      @nancy.atomic_pull :groups, 'peons'
      @nancy.reload.groups.should eql %w[users]
    end
    
    it "should pull all" do
      @bob.atomic_pull_all :groups, %w[users admins]
      @bob.reload.groups.should eql %w[moderators]
    end
    
    it "should update multiple field at the same time" do
      @bob.atomic_update :inc => {:post_count => 1}, :set => {:username => 'bobby'}, :pushAll => {:groups => %w[bosses idiots]}
      @bob.reload
      @bob.post_count.should eql 1
      @bob.groups.should eql %w[users moderators admins bosses idiots]
      @bob.username.should eql 'bobby'
    end
    
  end
  
end

      