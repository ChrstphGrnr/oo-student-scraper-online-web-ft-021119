require 'open-uri'
require 'pry'
require 'nokogiri'


# students = [ {name: "John", location: "NY", profile_url: "www.twitter.com"}, {name: "Ben", location: "LA", profile_url: "www.facebook.com"} ]

class Scraper

  def self.scrape_index_page(index_url)
    student_info = []
    doc = Nokogiri::HTML(open(index_url))
    binding.pry

    # students__names_array
    student_names = doc.css('h4.student-name').children.map {|student|student.text}
    student_location = doc.css('p.student-location').children.map {|student|student.text}
    student_profile = doc.css('a'    )

    student_names.each do |student|
      student_info << {name: student}
    end




    # binding.pry

  end



  def self.scrape_profile_page(profile_url)

  end

end
