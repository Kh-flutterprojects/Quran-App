import 'Databasehelper.dart';


class Reader {
  final String readerName;
  final String readerImagePath;
  final List<String> url;
  final List<String> soraName;
  String isFav;

  Reader(
      {required this.readerName,
      required this.readerImagePath,
      required this.soraName,
      required this.url,
      this.isFav="false",
      });


  factory Reader.fromJson(reader) {
    return Reader(
        readerName: reader["name"],
        readerImagePath: reader["image"],
        soraName: (reader["audioName"] as List).map((e) => e as String).toList(),
        url: (reader["url"] as List).map((e) => e as String).toList());
  }
}

class Sora{
  final readerName;
  final readerImagePath;
  final url;
  final soraName;
  final isFav;

  Sora(
      {this.readerName,
      this.readerImagePath,
      this.url,
      this.soraName,
      this.isFav});

  Map<String, String> toMap(){
    return {
      Databasehelper.readerName:this.readerName,
      Databasehelper.soraName:this.soraName,
      Databasehelper.soraUrl:this.url,
      Databasehelper.readerImagePath:this.readerImagePath,
      Databasehelper.isFav:this.isFav,
    };
  }

  factory Sora.fromJson(reader) {
    return Sora(
        readerName: reader["name"],
        readerImagePath: reader["path"],
        soraName: reader["soraname"],
        url:reader["soraurl"],
        isFav:reader["favorite"],
      );
  }
}

