require 'pry'
class Spell
    attr_accessor :name, :desc, :level, :range, :duration, :casting_time, :school, :damage

    def initialize(spell_data)
        # binding.pry
        @name = spell_data["name"]
        @desc = spell_data["desc"][0]
        @range = spell_data["range"]
        @duration = spell_data["duration"]
        @casting_time = spell_data["casting_time"]
        @school = spell_data["school"]["name"]
        
        if spell_data["damage"] && spell_data["damage"]["damage_at_slot_level"]
            @damage = spell_data["damage"]["damage_at_slot_level"]
        else
            @damage = "N/A"
        end
        
        @level = spell_data["level"]

    end

end