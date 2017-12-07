class User < ApplicationRecord
  rolify
  acts_as_authentic
end
