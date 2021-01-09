require_relative "../config/environment"

class GetSpell
    attr_accessor :input

    def initialize(input)
        @input = input
        # self.get
    end

    def get_spell
        @input = @input.downcase.gsub(" ", "-")
        url = "https://www.dnd5eapi.co/api/spells/#{@info}"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response_hash = JSON.parse(response.body)
    end

    def get_spells_by_level
        @input = @input.to_i
        url = "https://www.dnd5eapi.co/api/spells?level=#{@input}"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response_hash = JSON.parse(response.body)
    end
   
end

# binding.pry