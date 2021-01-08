require_relative "../config/environment"
class Spell
    attr_accessor :name, :desc, :level, :higher_level, :range, :duration, :casting_time, :school, :damage

    @@all = []

    def initialize(spell_data)
        self.name = spell_data["name"]
        self.desc = spell_data["desc"][0]
        self.level = spell_data["level"]
        self.higher_level = spell_data["higher_level"]
        self.range = spell_data["range"]
        self.duration = spell_data["duration"]
        self.casting_time = spell_data["casting_time"]
        self.school = spell_data["school"]["name"]
        self.damage = spell_data["damage"]["damage_at_slot_level"]
    end

    # def get
    #     url = "https://www.dnd5eapi.co/api/spells/#{@spell_name}"
    #     uri = URI.parse(url)
    #     response = Net::HTTP.get_response(uri)
    #     @response_hash = JSON.parse(response.body)
    #     @@all << @response_hash
    # end

end

#binding.pry