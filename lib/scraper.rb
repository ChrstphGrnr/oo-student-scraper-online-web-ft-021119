require 'open-uri'
require 'pry'
require 'nokogiri'


# students = [ {name: "John", location: "NY", profile_url: "www.twitter.com"}, {name: "Ben", location: "LA", profile_url: "www.facebook.com"} ]

class Scraper

  def self.scrape_index_page(index_url)

    doc = Nokogiri::HTML(open(index_url))
    student_roster = doc.css('div.student-card')
    # binding.pry

    students = []
    student_roster.each do |student|
      # binding.pry
      students << {
        name: student.css('h4.student-name').text,
        location: student.css('p.student-location').text,
        profile_url: student.css('a').first['href']
      }
      # binding.pry
    end

    students

  end



  def self.scrape_profile_page(profile_url)

  end

end
