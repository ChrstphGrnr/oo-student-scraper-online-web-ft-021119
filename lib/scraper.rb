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

    doc = Nokogiri::HTML(open(profile_url))
    # binding.pry
    socials = {}
    social_links = doc.css('div.social-icon-container a')
    # binding.pry
    social_links.each do |social|
      if social.attribute('href').value.include?("twitter")
        socials[:twitter] = social.attribute('href').value
      elsif social.attribute('href').value.include?("linkedin")
        socials[:linkedin] = social.attribute('href').value
      elsif social.attribute('href').value.include?("github")
        socials[:github] = social.attribute('href').value
      elsif social.attribute('href').value.length > 0
        socials[:blog] = social.attribute('href').value
      end
      # binding.pry
    end

    socials[:profile_quote] = doc.css('div.profile-quote').text
    socials[:bio] = doc.css('div.description-holder p').text


    socials

      # twitter: social_links[0].attribute('href').value
      # linkedin: social_links[1].attribute('href').value
      # github: social_links[2].attribute('href').value
      # blog: social_links[3].attribute('href').value
      # profile_quote: doc.css('div.profile-quote').text
      # bio: doc.css('div.description-holder p').first.text


  end

end
