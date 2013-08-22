require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here

  validates :email, uniqueness: true
  validates :email, format: { with: /\w+\S*@\w+[\.]\w{2,}/i }
  validates :age, numericality: { greater_than_or_equal_to: 5 }
  validates :phone, format: { with: /\(?\d{3}\)?[-.\s]\d{3}[-.\s]\d{4}\s?x?\d*/ }

  
  def name 
    "#{first_name} #{last_name}"
  end

  def age
    ((Time.now - birthday.to_time).to_i / 31557600)
  end

end

