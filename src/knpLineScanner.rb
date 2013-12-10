# -*- coding: utf-8 -*-

require File.join(File.dirname(__FILE__), './featureExtractor.rb')


class KnpLineScanner
  def initialize(textID = nil)
    @textID=textID
    @knpLines=[]
  end

  def scanKnpLine
    while line = STDIN.gets
      #ID行
      if /# S-ID:(tsubame00-.*-\d*)-\d*\s/ =~ line
        newID = $1
        if @textID.nil?
          #最初のID
          @textID=newID
        elsif @textID != newID
          featureExtractor=FeatureExtractor.new(@textID, @knpLines)
          #nounExtractor.extractFeature()

          @textID=newID
        else

        end
      else
        @knpLines << line
      end
    end
  end

end

#main
if __FILE__ == $PROGRAM_NAME
  nounExtractor = KnpLineScanner.new
  nounExtractor.scanKnpLine
end
