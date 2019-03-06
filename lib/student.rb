class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    student_hash.each do |k, v|
      self.send("#{k.to_s}=", v)
    end
    @@all << self
  end

  def self.create_from_collection(students_array)
    binding.pry
    Student.new(students_array)
  end

  def add_student_attributes(attributes_hash)

  end

  def self.all

  end

  def self.all
    @@all
  end
end
