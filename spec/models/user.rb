class User
  include Mongoid::Document
  include Mongoid::Atomic
  
  field :username
  field :groups, :type => Array, :defaults => ['users']
  field :post_count, :type => Integer, :default => 0
  
end
