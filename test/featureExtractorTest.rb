# -*- coding: utf-8 -*-
require 'test/unit'
require File.join(File.dirname(__FILE__), '../src/featureExtractor.rb')

class FeatureExtractorTest < Test::Unit::TestCase

  def test_extractNoun_human
    #echo "太郎は将来エンジニアになるのが夢だ。" | juman | knp -tab
    knpLines=<<ENDOFKNP
* 2D <文頭><人名><ハ><助詞><体言><係:未格><提題><区切:3-5><主題表現><格要素><連用要素><正規化代表表記:太郎/たろう><主辞代表表記:太郎/たろう>
+ 3D <文頭><人名><ハ><助詞><体言><係:未格><提題><区切:3-5><主題表現><格要素><連用要素><名詞項候補><先行詞候補><SM-人><SM-主体><正規化代表表記:太郎/たろう><解析格:ガ>
太郎 たろう 太郎 名詞 6 人名 5 * 0 * 0 "人名:日本:名:45:0.00106 疑似代表表記 代表表記:太郎/たろう" <人名:日本:名:45:0.00106><疑似代表表記><代表表記:太郎/たろう><正規化代表表記:太郎/たろう><文頭><漢字><かな漢字><名詞相当語><自立><内容語><タグ単位始><文節始><固有キー><文節主辞>
は は は 助詞 9 副助詞 2 * 0 * 0 NIL <かな漢字><ひらがな><付属>
* 2D <未来句><ニ><助詞><体言><係:ニ格><区切:0-0><格要素><連用要素><正規化代表表記:将来/しょうらい+エンジニア/えんじにあ><主辞代表表記:エンジニア/えんじにあ>
+ 2D <文節内><係:文節内><時間><未来句><体言><名詞項候補><先行詞候補><正規化代表表記:将来/しょうらい>
将来 しょうらい 将来 名詞 6 時相名詞 10 * 0 * 0 "代表表記:将来/しょうらい 弱時相名詞 カテゴリ:時間" <代表表記:将来/しょうらい><弱時相名詞><カテゴリ:時間><正規化代表表記:将来/しょうらい><漢字><かな漢字><名詞相当語><自立><内容語><タグ単位始><文節始>
+ 3D <未来句><ニ><助詞><体言><係:ニ格><区切:0-0><格要素><連用要素><SM-主体><SM-人><名詞項候補><先行詞候補><正規化代表表記:エンジニア/えんじにあ><解析格:ニ>
エンジニア えんじにあ エンジニア 名詞 6 普通名詞 1 * 0 * 0 "代表表記:エンジニア/えんじにあ カテゴリ:人 ドメイン:科学・技術" <代表表記:エンジニア/えんじにあ><カテゴリ:人><ドメイン:科学・技術><正規化代表表記:エンジニア/えんじにあ><記英数カ><カタカナ><名詞相当語><自立><複合←><内容語><タグ単位始><固有キー><文節主辞>
に に に 助詞 9 格助詞 1 * 0 * 0 NIL <かな漢字><ひらがな><付属>
* 3D <形副名詞><ガ><助詞><強調構文><用言:動><タグ単位受:-1><係:ガ格><レベル:B><区切:3-5><ID:〜の〜><提題受:10><格要素><連用要素><動態述語><正規化代表表記:成る/なる?鳴る/なる><主辞代表表記:成る/なる?鳴る/なる>
+ 4D <文節内><係:文節内><連体修飾><用言:動><動態述語><強調構文><格要素指定:2><正規化代表表記:成る/なる?鳴る/なる><用言代表表記:成る/なる?鳴る/なる><時制-未来><格関係0:ガ:太郎><格関係2:ニ:エンジニア><格関係5:ヲ:夢><格解析結果:成る/なる:動11:ガ/N/太郎/0/0/1;ヲ/N/夢/5/0/1;ニ/C/エンジニア/2/0/1;デ/U/-/-/-/-;カラ/U/-/-/-/-;ヨリ/U/-/-/-/-;時間/U/-/-/-/-;外の関係/U/-/-/-/-;修飾/U/-/-/-/-;ノ/U/-/-/-/-;ニヨル/U/-/-/-/->
なる なる なる 動詞 2 * 0 子音動詞ラ行 10 基本形 2 "代表表記:成る/なる 自他動詞:他:成す/なす;他:する/する" <代表表記:成る/なる><自他動詞:他:鳴らす/ならす><正規化代表表記:成る/なる?鳴る/なる><品曖><ALT-なる-なる-なる-2-0-10-2-"代表表記:鳴る/なる 自他動詞:他:鳴らす/ならす"><品曖-動詞><原形曖昧><かな漢字><ひらがな><活用語><自立><内容語><タグ単位始><文節始><文節主辞><用言曖昧性解消>
+ 5D <形副名詞><ガ><助詞><強調構文><タグ単位受:-1><係:ガ格><レベル:B><区切:3-5><ID:〜の〜><提題受:10><格要素><連用要素><動態述語><外の関係><受けNONE><解析格:ガ>
の の の 名詞 6 形式名詞 8 * 0 * 0 "疑似代表表記 代表表記:の/の" <疑似代表表記><代表表記:の/の><正規化代表表記:の/の><かな漢字><ひらがな><名詞相当語><形副名詞><付属><特殊非見出語><内容語><タグ単位始>
が が が 助詞 9 格助詞 1 * 0 * 0 NIL <かな漢字><ひらがな><付属>
* -1D <文末><ルール外の関係><句点><体言><用言:判><一文字漢字><レベル:C><区切:5-5><ID:（文末）><裸名詞><係:文末><提題受:30><主節><格要素><連用要素><状態述語><正規化代表表記:夢/ゆめ><主辞代表表記:夢/ゆめ>
+ -1D <文末><ルール外の関係><句点><体言><用言:判><一文字漢字><レベル:C><区切:5-5><ID:（文末）><裸名詞><係:文末><提題受:30><主節><格要素><連用要素><状態述語><判定詞><名詞項候補><先行詞候補><正規化代表表記:夢/ゆめ><用言代表表記:夢/ゆめ><時制-現在><時制-無時制><解析連格:ヲ><格関係4:ガ:の><格解析結果:夢/ゆめ:判1:ガ/C/の/4/0/1;ヲ/U/-/-/-/-;ニ/U/-/-/-/-;ト/U/-/-/-/-;デ/U/-/-/-/-;カラ/U/-/-/-/-;時間/U/-/-/-/-;外の関係/U/-/-/-/-;ノ/U/-/-/-/-;修飾/U/-/-/-/-;ガ２/U/-/-/-/->
夢 ゆめ 夢 名詞 6 普通名詞 1 * 0 * 0 "代表表記:夢/ゆめ 漢字読み:訓 カテゴリ:抽象物 ドメイン:家庭・暮らし" <代表表記:夢/ゆめ><漢字読み:訓><カテゴリ:抽象物><ドメイン:家庭・暮らし><正規化代表表記:夢/ゆめ><漢字><かな漢字><名詞相当語><自立><内容語><タグ単位始><文節始><文節主辞>
だ だ だ 判定詞 4 * 0 判定詞 25 基本形 2 NIL <表現文末><かな漢字><ひらがな><活用語><付属>
。 。 。 特殊 1 句点 1 * 0 * 0 NIL <文末><英記号><記号><付属>
EOS
ENDOFKNP
    featureExtractor = FeatureExtractor.new("pseudoID", knpLines.split("\n"))
    assert_equal(["太郎:人名", "エンジニア:人"], featureExtractor.extractNoun)
  end

  
  def test_extractNoun_animal
    #echo "太郎は猫と遊んでいる。" | juman | knp -tab
    knpLines=<<ENDOFKNP
* 2D <文頭><人名><ハ><助詞><体言><係:未格><提題><区切:3-5><主題表現><格要素><連用要素><正規化代表表記:太郎/たろう><主辞代表表記:太郎/たろう>
+ 2D <文頭><人名><ハ><助詞><体言><係:未格><提題><区切:3-5><主題表現><格要素><連用要素><名詞項候補><先行詞候補><SM-人><SM-主体><正規化代表表記:太郎/たろう><解析格:ガ>
太郎 たろう 太郎 名詞 6 人名 5 * 0 * 0 "人名:日本:名:45:0.00106 疑似代表表記 代表表記:太郎/たろう" <人名:日本:名:45:0.00106><疑似代表表記><代表表記:太郎/たろう><正規化代表表記:太郎/たろう><文頭><漢字><かな漢字><名詞相当語><自立><内容語><タグ単位始><文節始><固有キー><文節主辞>
は は は 助詞 9 副助詞 2 * 0 * 0 NIL <かな漢字><ひらがな><付属>
* 2D <ト><助詞><体言><一文字漢字><係:ト格><並キ:名:&ST:5.0><区切:1-4><並列タイプ:AND><格要素><連用要素><正規化代表表記:猫/ねこ><主辞代表表記:猫/ねこ><並列類似度:-100.000>
+ 2D <ト><助詞><体言><一文字漢字><係:ト格><並キ:名:&ST:5.0><区切:1-4><並列タイプ:AND><格要素><連用要素><名詞項候補><先行詞候補><正規化代表表記:猫/ねこ><解析格:ト>
猫 ねこ 猫 名詞 6 普通名詞 1 * 0 * 0 "代表表記:猫/ねこ 漢字読み:訓 カテゴリ:動物" <代表表記:猫/ねこ><漢字読み:訓><カテゴリ:動物><正規化代表表記:猫/ねこ><漢字><かな漢字><名詞相当語><自立><内容語><タグ単位始><文節始><文節主辞>
と と と 助詞 9 格助詞 1 * 0 * 0 NIL <かな漢字><ひらがな><付属>
* -1D <文末><句点><用言:動><レベル:C><区切:5-5><ID:（文末）><係:文末><提題受:30><主節><格要素><連用要素><動態述語><正規化代表表記:遊ぶ/あそぶ><主辞代表表記:遊ぶ/あそぶ>
+ -1D <文末><句点><用言:動><レベル:C><区切:5-5><ID:（文末）><係:文末><提題受:30><主節><格要素><連用要素><動態述語><正規化代表表記:遊ぶ/あそぶ><用言代表表記:遊ぶ/あそぶ><時制-未来><主題格:一人称優位><格関係0:ガ:太郎><格関係1:ト:猫><格解析結果:遊ぶ/あそぶ:動1:ガ/N/太郎/0/0/1;ヲ/U/-/-/-/-;ニ/U/-/-/-/-;ト/C/猫/1/0/1;デ/U/-/-/-/-;カラ/U/-/-/-/-;ヨリ/U/-/-/-/-;マデ/U/-/-/-/-;ヘ/U/-/-/-/-;時間/U/-/-/-/-;外の関係/U/-/-/-/-;修飾/U/-/-/-/-;ノ/U/-/-/-/-;トスル/U/-/-/-/-;ヲフクメル/U/-/-/-/-;ニヨル/U/-/-/-/-;トイウ/U/-/-/-/-;ニツク/U/-/-/-/-;ニアワセル/U/-/-/-/-;ヲツウジル/U/-/-/-/->
遊んで あそんで 遊ぶ 動詞 2 * 0 子音動詞バ行 8 タ系連用テ形 14 "代表表記:遊ぶ/あそぶ ドメイン:レクリエーション" <代表表記:遊ぶ/あそぶ><ドメイン:レクリエーション><正規化代表表記:遊ぶ/あそぶ><かな漢字><活用語><自立><内容語><タグ単位始><文節始><文節主辞>
いる いる いる 接尾辞 14 動詞性接尾辞 7 母音動詞 1 基本形 2 "代表表記:いる/いる" <代表表記:いる/いる><正規化代表表記:いる/いる><表現文末><かな漢字><ひらがな><活用語><付属>
。 。 。 特殊 1 句点 1 * 0 * 0 NIL <文末><英記号><記号><付属>
EOS
ENDOFKNP
    featureExtractor = FeatureExtractor.new("pseudoID", knpLines.split("\n"))
    assert_equal(["太郎:人名", "猫:動物"], featureExtractor.extractNoun)
  end
  
  # def test_3
  #   assert_equal("おはよう", "おはよう")
  # end


end