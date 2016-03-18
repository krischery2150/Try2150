class User < ActiveRecord::Base
  before_save {self.email = email.downcase}
  # this before_save is a callback method. What it does is before it saves the email
  #address it calls back and transforms all the letters into lower case. Had to do the indexing
  #in active record in order for the method to work
  validates :first_name , presence: true, length: {maximum: 15}
  validates :last_name, presence: true, length: {maximum: 10}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    #code that ensures that a user  puts the right format for emails in signup
    #fields
  validates :email, presence: true, length:{maximum: 50},
                                    format: {with: VALID_EMAIL_REGEX },
                                    uniqueness: { case_sensitive: false }
                                    #rails still assumes that uniquess is true
                                    #whether the user types CAMELcase or lowercase
  validates :password, presence: true, length:{maximum: 50}

  has_secure_password


end
