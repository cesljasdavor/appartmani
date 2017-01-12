class Person < ActiveRecord::Base
  self.table_name = "persons"
  belongs_to :user
end