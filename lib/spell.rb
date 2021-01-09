require 'pry'
class Spell
    attr_accessor :name, :desc, :level, :higher_level, :range, :duration, :casting_time, :school, :damage

    def initialize(spell_data)
        
        @name = spell_data["name"]
        @desc = spell_data["desc"][0]
        @range = spell_data["range"]
        @duration = spell_data["duration"]
        @casting_time = spell_data["casting_time"]
        @school = spell_data["school"]["name"]
        @damage = spell_data["damage"]["damage_at_slot_level"]
        @level = spell_data["level"]
        @higher_level = spell_data["higher_level"]
        # binding.pry
    end
    
end

#binding.pry