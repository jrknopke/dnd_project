class School
    attr_accessor :count, :names

    @@all = []

    def initialize(class_data)
        @count = class_data["count"]
        class_data["results"].each_with_index do |result, i|
            i +=1
            name = result["name"]
            @@all << "#{i}. #{name}"
        end
        @names = @@all
    end

end