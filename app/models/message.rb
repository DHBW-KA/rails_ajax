class Message < ActiveRecord::Base
  sync :all
  validates_presence_of :body
end
