# Thanks for the challenge. It was my first time being exposed to Ruby. Hope I understood the task right.

require 'date' 

class User
    attr_reader :name, :date_of_birth
    def initialize(name, date_of_birth) 
     @name = name
     @date_of_birth = date_of_birth
    end
#Returns an Integer representing the user’s current age
  def age
    now = Time.now.utc.to_date
    now.year - date_of_birth.year - ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1)
  end
#Returns a Date object for the user's current upcoming birthday
  def next_birthday
    # x = bday , y = current date; x-y should give days remaining until next birthday. 
    # It's logical to think about the birthdays that have already passed this year.
     bday = Date.new(Date.today.year, date_of_birth.month, date_of_birth.day)

    # Code in the comment below should work for the logic of birthdays that passed, but I can't get it right.
    # bday += 1.year if Date.today >= bday 
    
    bday += 365 if Date.today >= bday  #leap year problem. 
    (bday - Date.today).to_i
    # output : 1986-01-01=> -312; 1988-11-08=> 0; 1990-12-30=> 52
  end
end

tests = [
	Date.new(1986, 1, 1),
	Date.new(1988, Date.today.month, Date.today.day), 
	Date.new(1990, 12, 30),
]

puts "====== ages ======" 
tests.each do|date|
	puts "#{date}=> #{User.new("Test", date).age}"
end

puts "====== birthdays ======"
tests.each do|date|
	puts "#{date}=> #{User.new("Test", date).next_birthday}"
end
