class User < ApplicationRecord
 has_many :messages
 accepts_nested_attributes_for :messages, 
                                  reject_if: lambda { |attrs| attrs['name'].blank? }
end
