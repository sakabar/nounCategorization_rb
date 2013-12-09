# -*- coding: utf-8 -*-
class NounExtractor
  NounListDir='./nounLists/'

  def initialize(textID = "nil")
    @textID=textID
    @nounListFile = File.open("./nounLists/" + @textID, 'a')
  end

  def scan
    
    while line = STDIN.gets

      #ID行
      if /# S-ID:(tsubame00-.*-\d*)-\d*\s/ =~ line
        if $1 != @textID
          @textID=$1
          unless @nounListFile.closed?
            @nounListFile.close
          end
          @nounListFile = File.open(NounListDir + @textID,"a")
        end

      #文節行
      elsif /^[\+\*]\s/ =~ line
        
      #品詞が曖昧
      elsif /品曖/ =~ line
          
      else
        if (/普通名詞/ =~ line) || (/固有名詞/ =~ line)
          if /カテゴリ:人[\"\s]/ =~ line
            @nounListFile.puts((line.split(" ")[0]) + ":人")
          elsif /カテゴリ:動物[\"\s]/ =~ line
            @nounListFile.puts((line.split(" ")[0]) + ":動物")
          elsif /人名/ =~ line
            @nounListFile.puts((line.split(" ")[0]) + ":人名")
          end
        end
      end
    end
  
    @nounListFile.close
  end

end

#main
if __FILE__ == $PROGRAM_NAME
  nounExtractor = NounExtractor.new
  nounExtractor.scan
end
