# I freely admit that this following block of code isn't mine, but I do understand what it is doing! The String class doesn't implicitly have a titleize method, so this is creating a new method for the String class that splits out a phrase, capitalizes each word and joins them back together with a space. It's so I can search for an artist where a user types in lowercase, uppercase, etc.

class String
  def titleize
    self.split(" ").map{|word| word.capitalize}.join(" ")
  end
end