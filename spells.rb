class Spell
    attr_accessor 

    require 'open-uri'
    require 'net/http'
    require 'json'

    require 'pry'

    def initialize(spell_name)
        @spell_name = spell_name
        @spell_name = @spell_name.downcase.gsub(" ", "-")
        # url = "https://www.dnd5eapi.co/api/spells/#{spell_name}"
        # uri = URI.parse(url)
        # response = Net::HTTP.get_response(uri)
        # response_hash = JSON.parse(response.body)
    end

    def get
        url = "https://www.dnd5eapi.co/api/spells/#{@spell_name}"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response_hash = JSON.parse(response.body)
    end
end

    #binding.pry

class CLI
    attr_accessor :response_hash

    def initialize
        puts "Welcome to Spell Finder."
        enter_spell
    end

    def enter_spell
        puts "Please enter a spell from DnD Fifth Edition:"
        spell_name = gets.chomp
        puts "Thanks. Gathering information about your Spell..."
        get_info(spell_name)
    end

    def get_info(spell_name)
        new_spell = Spell.new(spell_name)
        @response_hash = new_spell.get
        display_info
    end

    def display_info
        puts "Name: #{@response_hash["name"]}"
        puts "Description: #{@response_hash["desc"]}"
    end
end

CLI.new