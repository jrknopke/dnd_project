require_relative "../config/environment"

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
        if input == 'Spell'
            find_by_name
        elsif input == 'Level'
            find_by_level
        elsif input == 'School'
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
        get_all_spells_at_level(level)
    end

    def get_spell(spell_name)
        new_spell = GetSpell.new(spell_name)
        response_hash = new_spell.get_spell
        @spell = Spell.new(response_hash)
        display_spell_info
    end

    def get_spells_by_level(Level)
        list = GetSpell.new(level)
        response_hash = list.get_spells_by_level
        

    end

    def display_spell_info
        puts "Name: #{@spell.name}"
        puts "Description: #{@spell.desc}"
        puts "Damage: #{@spell.damage}"
        puts "Range: #{@spell.range}"
        puts "Duration: #{@spell.duration}"
        puts "Casting Time: #{@spell.casting_time}"
        puts "Level: #{@spell.level}"
        puts "Higher Level: #{@spell.higher_level}"
        puts "School: #{@spell.school}"
    end

end