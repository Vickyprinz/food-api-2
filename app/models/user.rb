class User < ApplicationRecord
    has_secure_password
    has_one :cart
    has_many :orders
  
    validates :username, {
        length: { minimum: 5, maximum: 8 },
         uniqueness: true, 
         presence: true
   }

   validates :email, { 
       uniqueness: true, 
       presence: true
   }
   
end
