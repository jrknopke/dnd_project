require 'pry'
class CLI
    attr_accessor :response_hash

    def initialize
        puts "Welcome to Spell Finder."
        puts "If you would like to see info for a specific spell, type 'Spell'"
        puts "If you would like to see all spells for a certain level, type 'Level'"
        puts "If you would like to see all spells of a certain school, type 'School'"
        get_input
    end

    def get_input
        input = gets.chomp
        input = input.downcase
        if input == 'spell'
            find_by_name
        elsif input == 'level'
            find_by_level
        elsif input == 'school'
            find_by_school
        else
            puts "Invalid command. Please enter valid command."
            get_input
        end
    end

    def find_by_name
        puts "Please enter a spell name:"
        spell_name = gets.chomp
        puts "Thanks. Gathering information about your Spell..."
        get_spell(spell_name)
    end

    def find_by_level
        puts "Please enter the level you would like to see spells for (as a number):"
        level = gets.chomp
        puts "Thanks. Gathering list of spells for level #{level}..."
        get_spells_at_level(level)
    end

    def find_by_school
        puts "Please enter the School of Magic you would like to see spells for:"
        school = gets.chomp
        puts "Thanks. Gathering list of spells in the school of #{school}"
        get_spells_for_school(school)
    end

    def get_spell(spell_name)
        new_spell = GetSpell.new(spell_name)
        response_hash = new_spell.get_spell_by_name
        # binding.pry
        if response_hash.include?("error")
            puts "Spell not found."
            find_by_name
        end
        @spell = Spell.new(response_hash)
        display_spell_info
    end

    def get_spells_at_level(level)
        list = GetSpell.new(level)
        response_hash = list.get_spells_by_level
        @list = LevelList.new(response_hash)
        display_list_info
    end

    def get_spells_for_school(school)
        school = GetSpell.new(school)
        response_hash = school.get_spells_by_school
        @school = School.new(response_hash)
        display_class_info
    end

    def display_spell_info
        puts "Name: #{@spell.name}"
        puts " "
        puts "Description: #{@spell.desc}"
        puts " "
        puts "Damage:"
        
        if @spell.damage != "N/A"
            @spell.damage.each do |lvl, dmg|
                puts "Level #{lvl}: #{dmg} damage"
            end
        else
            puts "N/A"
        end

        puts " "
        puts "Range: #{@spell.range}"
        puts "Duration: #{@spell.duration}"
        puts "Casting Time: #{@spell.casting_time}"
        puts "Level: #{@spell.level}"
        puts "School: #{@spell.school}"
        puts " "
        puts "Would you like to search again?"
        answer= gets.chomp
        answer= answer.downcase
        if answer == 'yes'
            CLI.new
        elsif answer == 'no'
            exit
        end

    end

    def display_list_info
        puts "There are #{@list.count} spells for this level."
        @list.names.each do |spell|
            puts "#{spell}"
        end
        puts "Would you like to search again?"
        answer= gets.chomp
        answer= answer.downcase
        if answer == 'yes'
            CLI.new
        elsif answer == 'no'
            exit
        end
    end

    def display_class_info
        puts "There are #{@school.count} spells in this School of Magic."
        @school.names.each do |spell|
            puts "#{spell}"
        end
        puts "Would you like to search again?"
        answer= gets.chomp
        answer= answer.downcase
        if answer == 'yes'
            CLI.new
        elsif answer == 'no'
            exit
        end
    end

end