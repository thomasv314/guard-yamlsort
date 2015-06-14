module Guard
  class Yamlsort
    class FileSorter

      attr_accessor :yaml

      # Initialized with the path of the YAML file we want to sort. It automatically
      # loads the file, stores any comments in memory, and then starts sorting 
      # unless otherwise specified with the start_on_init parameter.
      # If no parameters are passed a Generic  
      # @param path [String] the path on disc this file is located at
      # @param start_on_init [Boolean] whether or not to automatically sort & write on 
      #   initialization of a FileSorter (for testing purposes)
      def initialize(path, start_on_init = true)
        @path = path
        @comments = []
        load_yaml 
        sort_yaml
        write_yaml
      end
      
      # Load the YAML file contents into @yaml and store the comments in @comments 
      def load_yaml
        self.yaml= File.open(@path, "r") do |f| 
          contents = f.read
          contents.split("\n").each do |line|
            @comments.push(line) if line[0] == '#'
          end
          YAML.load(contents) 
        end
      end

      # Recursively sort the contents of @yaml
      def sort_yaml
        self.yaml= self.class.sort(yaml)
      end

      # Sorts the hash alphabetically by it's keys and then writes the original comments 
      # plus the sorted hash to the same path in a valid YAML file.
      def write_yaml
        File.open(@path, "w") do |f| 
          if !@comments.empty?
            f.write @comments.join("\n")
            f.write("\n")
          end
          f.write YAML.dump(yaml)
        end
      end

      # Recursively sorts any hash it's given by key using Array#sort
      def self.sort(obj)
        if obj.is_a? Hash
          sorted = {}
          obj.keys.sort.each { |k| sorted[k] = sort(obj[k]) }
          sorted
        else 
          return obj
        end
      end

    end
  end
end
