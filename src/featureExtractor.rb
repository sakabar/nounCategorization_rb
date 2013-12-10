# -*- coding: utf-8 -*-

#テキストの列の受け取り、解析して、そのテキスト内の名詞を保持する
class FeatureExtractor
attr_reader :textID, :knpLines, :nounList
  NounListDir='./nounLists/'

  def initialize(textID, knpLines)
    @textID=textID
    @knpLines=knpLines
    @nounList=extractNoun(@knpLines)
  end

  def extractFeature

  end



  def extractNoun(knpLines)
    ans=[]
    knpLines.each do |line|

      #文節行
      if /^[\+\*]\s/ =~ line
        
        #品詞が曖昧
      elsif /品曖/ =~ line
        
      elsif  /人名/ =~ line
          ans << ((line.split(" ")[2]) + ":人名")
      elsif (/普通名詞/ =~ line) || (/固有名詞/ =~ line)
        if /カテゴリ:人[\"\s]/ =~ line
          ans << ((line.split(" ")[2]) + ":人")
        elsif /カテゴリ:動物[\"\s]/ =~ line
          ans << ((line.split(" ")[2]) + ":動物")
        end
      end
    end #end of block
    return ans
  end

end
