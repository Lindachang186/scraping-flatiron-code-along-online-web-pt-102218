require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
      doc = Nokogiri::HTML(open("https://rickandmortyapi.com/api/character"))

      # doc.css(".post").each do |post|
    #   course = Course.new
    #   course.title = post.css("h2").text
    #   course.schedule = post.css(".date").text
    #   course.description = post.css("p").text
    #   binding.pry
    # end
  end

  def get_courses
    self.get_page.css("p").children
  end

  def make_courses
    self.get_courses.each do |post|
      binding.pry
    course = Course.new
    course.title = post.css("h2").text
    course.schedule = post.css(".date").text
    course.description = post.css("p").text

  end
  end

Scraper.new.get_page

    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end
