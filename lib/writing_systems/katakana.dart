class Katakana{
  Map mainKana;
  Map dakutenKana;
  Map combinationKana;

  Map getQuestions(String type){
    if(type == "Main Kana"){
      return mainKana;
    }
    else if(type == "Dakuten Kana"){
      return dakutenKana;
    }
    return combinationKana;
  }

  Katakana(){
    this.mainKana = {
      "ア": "a",
      "イ": "i",
      "ウ": "u",
      "エ": "e",
      "オ": "o",
      "カ": "ka",
      "キ": "ki",
      "ク": "ku",
      "ケ": "ke",
      "コ": "ko",
      "サ": "sa",
      "シ": "shi",
      "ス": "su",
      "セ": "se",
      "ソ": "so",
      "タ": "ta",
      "チ": "chi",
      "ツ": "tsu",
      "テ": "te",
      "ト": "to",
      "ナ": "na",
      "ニ": "ni",
      "ヌ": "nu",
      "ネ": "ne",
      "ノ": "no",
      "ハ": "ha",
      "ヒ": "hi",
      "フ": "fu",
      "ヘ": "he",
      "ホ": "ho",
      "マ": "ma",
      "ミ": "mi",
      "ム": "mu",
      "メ": "me",
      "モ": "mo",
      "ヤ": "ya",
      "ユ": "yu",
      "ヨ": "yo",
      "ラ": "ra",
      "リ": "ri",
      "ル": "ru",
      "レ": "re",
      "ロ": "ro",
      "ワ": "wa",
      "ヲ": "o/wo",
      "ン": "n",
    };

    this.dakutenKana = {
      "ガ":"ga",
      "ギ":"gi",
      "グ":"gu",
      "ゲ":"ge",
      "ゴ":"go",
      "ザ":"za",
      "ジ":"ji/zi",
      "ズ":"zu",
      "ゼ":"ze",
      "ゾ":"zo",
      "ダ":"da",
      "ヂ":"ji/di",
      "ヅ":"zu/du",
      "デ":"de",
      "ド":"do",
      "バ":"ba",
      "ビ":"bi",
      "ブ":"bu",
      "ベ":"be",
      "ボ":"bo",
      "パ":"pa",
      "ピ":"pi",
      "プ":"pu",
      "ペ":"pe",
      "ポ":"po",
    };

    this.combinationKana = {
      "キャ":"kya",
      "キュ":"kyu",
      "キョ":"kyo",
      "シャ":"sha",
      "シュ":"shu",
      "ショ":"sho",
      "チャ":"cha",
      "チュ":"chu",
      "チョ":"cho",
      "ニャ":"nya",
      "ニュ":"nyu",
      "ニョ":"nyo",
      "ヒャ":"hya",
      "ヒュ":"hyu",
      "ヒョ":"hyo",
      "ミャ":"mya",
      "ミュ":"myu",
      "ミョ":"myo",
      "リャ":"rya",
      "リュ":"ryu",
      "リョ":"ryo",
      "ギャ":"gya",
      "ギュ":"gyu",
      "ギョ":"gyo",
      "ジャ":"ja",
      "ジュ":"ju",
      "ジョ":"jo",
      "ビャ":"bya",
      "ビュ":"byu",
      "ビョ":"byo",
      "ピャ":"pya",
      "ピュ":"pyu",
      "ピョ":"pyo",
    };
  }
}