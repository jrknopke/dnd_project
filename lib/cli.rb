require_relative "../config/environment"

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
        new_spell = GetSpell.new(spell_name)
        @response_hash = new_spell.get
        @spell = Spell.new(@response_hash)
        display_info
    end

    def display_info
        puts "Name: #{@spell.name}"
        puts "Description: #{@spell.desc}"
        puts "Damage: #{@spell.damage}"
        puts "Level: #{@spell.level}"
        puts "Higher Level: #{@spell.higher_level}"
        puts "Range: #{@spell.range}"
        puts "Duration: #{@spell.duration}"
        puts "Casting Time: #{@spell.casting_time}"
        puts "School: #{@spell.school}"
    end

end