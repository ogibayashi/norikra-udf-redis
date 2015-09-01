require 'java'
require 'norikra/udf'

module Norikra
  module UDF

    class Incr < Norikra::UDF::SingleRow
      def self.init
        require 'norikra-udf-redis.jar'
      end

      def definition
        # function_name, Java Class Name (fqdn),    static function name
        ["incr", "jp.gr.java_conf.ogibayashi.norikra.udf.Redis", "incr"]
      end
    end

    class Incrby < Norikra::UDF::SingleRow
      def self.init
        require 'norikra-udf-redis.jar'
      end

      def definition
        # function_name, Java Class Name (fqdn),    static function name
        ["incrby", "jp.gr.java_conf.ogibayashi.norikra.udf.Redis", "incrby"]
      end
    end

    class RSet < Norikra::UDF::SingleRow
      def self.init
        require 'norikra-udf-redis.jar'
      end

      def definition
        # function_name, Java Class Name (fqdn),    static function name
        ["rset", "jp.gr.java_conf.ogibayashi.norikra.udf.Redis", "rset"]
      end
    end

    class RGet < Norikra::UDF::SingleRow
      def self.init
        require 'norikra-udf-redis.jar'
      end

      def definition
        # function_name, Java Class Name (fqdn),    static function name
        ["rget", "jp.gr.java_conf.ogibayashi.norikra.udf.Redis", "rget"]
      end
    end

    class RDel < Norikra::UDF::SingleRow
      def self.init
        require 'norikra-udf-redis.jar'
      end

      def definition
        # function_name, Java Class Name (fqdn),    static function name
        ["rdel", "jp.gr.java_conf.ogibayashi.norikra.udf.Redis", "rdel"]
      end
    end
    
  end
end
