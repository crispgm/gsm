module Gsm
  class Gem
    require "yaml"
    
    attr_reader :conf_path, :name_pivot
    attr_reader :sources
    attr_reader :use_name

    MAX_GENERATED_NAMES = 11
    GEMSTONE_NAMES = [
      "Amethyst",
      "Emerald",
      "Chrysocolla",
      "Hematite",
      "Jasper",
      "Malachite",
      "Quartz",
      "Ruby",
      "Sapphire",
      "Sugilite",
      "Turquoise"
    ].freeze

    def initialize(conf_path)
      @sources = Hash.new
      @use_name = ""
      @name_pivot = 0
      @conf_path = conf_path

      if !load_from_yaml?
        # load from `gem sources`
        load
      end
    end

    def load
      outputs = `gem sources -l`
      outputs.split("\n").each do |line|
        line.strip!
        if validate_url?(line)
          name = generate_name
          @sources[name] = line
        end
      end
    end

    def add(name, url)
      return false if validate_name?(name)

      # validate url
      if !validate_url?(url)
        return false
      end

      @sources[name] = url
      save

      name
    end

    def del(name)
      return false if @use_name.eql?(name)
      return nil if !@sources.has_key?(name)

      @sources.delete(name)
      save

      name
    end

    def get
      @use_name
    end

    def reset
      @use_name.clear
      @sources.clear
    end

    def use(name)
      return false if @sources.has_key?(name)
      return true if @use_name.eql?(name)

      if !apply_source(name)
        return false
      end

      @use_name = name
      @use_name
    end

    def save
      data = {
        :use => @use_name,
        :sources => @sources
      }
      # write to file
      f = File.new(@conf_path, "w")
      f.syswrite(data.to_yaml)
      f.close
    end

    def to_s
      return @sources[@use_name] if @sources.has_key?(@use_name)
    end

    private
    def apply_source(name)
      outputs = `gem sources -l`
      outputs.split("\n").each do |line|
        line.strip!
        if validate_url?(line)
          `gem sources --remove #{line}`
        end
      end

      url = @sources[name]
      output = `gem sources --add #{url}`
      output.include?("#{url} added to sources")
    end

    private
    def validate_name?(name)
      return false if %r{[a-zA-Z]{1,32}*} =~ name
      return false if @sources.has_key?(name)
      true
    end

    private
    def validate_url?(url)
      url.start_with?("http://") || url.start_with?("https://") ? true : false
    end

    private
    def load_from_yaml?
      # read yaml
      if File.exist?(@conf_path)
        data = YAML.load_file(@conf_path)
        @use_name = data[:use]
        @sources = data[:sources]
        true
      else
        f = File.new(@conf_path, "w")
        f.close
        false
      end
    end

    private
    def generate_name
      if @name_pivot >= MAX_GENERATED_NAMES - 1
        return GEMSTONE_NAMES[(++@name_pivot)-MAX_GENERATED_NAMES] << 
          "-" << 
          (@name_pivot/MAX_GENERATED_NAMES).to_s
      end

      GEMSTONE_NAMES[++@name_pivot]
    end
  end
end