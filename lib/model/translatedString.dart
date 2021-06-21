class TranslatedString{
   final String en , ar;

  TranslatedString({this.en, this.ar});

factory TranslatedString.fromMap(Map<String,dynamic> map){
    return TranslatedString(
      en: map['en'],
      ar: map['ar'],
    );
  }

   @override
  String toString() {
    return 'TranslatedString{en: $en, ar: $ar}';
  }
}