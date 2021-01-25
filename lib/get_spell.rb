class GetSpell
    attr_accessor :input

    def initialize(input)
        @input = input
    end

    def get_spell_by_name
        @input = @input.downcase.gsub(" ", "-")
        url = "https://www.dnd5eapi.co/api/spells/#{@input}"
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

    def get_spells_by_school
        @input = @input
        url = "https://www.dnd5eapi.co/api/spells?school=#{@input}"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response_hash = JSON.parse(response.body)
    end
   
end