require_relative "../config/environment"

class GetSpell
    
    def initialize(spell_name)
        @spell_name = spell_name.downcase.gsub(" ", "-")
        # self.get
    end

    def get
        url = "https://www.dnd5eapi.co/api/spells/#{@spell_name}"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response_hash = JSON.parse(response.body)
    end
   
end

# binding.pry