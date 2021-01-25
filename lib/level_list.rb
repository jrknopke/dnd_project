class LevelList
    attr_accessor :count, :names

    @@all = []

    def initialize(level_data)
        @count = level_data["count"]
        level_data["results"].each_with_index do |result, i|
            i +=1
            name = result["name"]
            @@all << "#{i}. #{name}"
        end
        @names = @@all
    end

end