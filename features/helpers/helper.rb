class Helper
    class << self
  
      # matcher is only available for curly brackets format ({}, {{}}, and so on)
      def resolve_variable(obj, target, matcher = /\{([a-zA-Z0-9_]+)\}/)
        resolved = target.gsub!(matcher) do |var|
          var.gsub!(/[\{\}]/, "")
          value = obj.instance_variable_get("@#{var}")
          puts "Variable @#{var} is nil or false!" unless value
  
          value
        end || target
  
        resolved
      end
  
      # matcher is only available for curly brackets format "{ENV:XXX}" and so on)
      def resolve_env(obj, target, matcher = /\{ENV:([a-zA-Z0-9_]+)\}/)
        resolved = target.gsub!(matcher) do |env_var|
          match = Regexp.last_match
          value = ENV[match[1]]
          puts "Variable @#{env_var} is nil or false!" unless value
  
          value
        end || target
  
        resolved
      end
    end
  end