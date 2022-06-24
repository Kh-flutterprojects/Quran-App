import 'dart:math';

import 'package:audioplayer/LocalDatabase/Reader.dart';
import 'package:audioplayer/Providers/ReaderProvider.dart';
import 'package:provider/provider.dart';

import 'Databasehelper.dart';

class LDBase {
  static final ldb = Databasehelper.instance;

  insertReader(List<Reader> rs) async {
    var Data = await ldb.GetAllSoras();
    if (Data.length == 0) {
      for (var reader in rs) {
        for (var i = 0; i < reader.url.length; i++) {
          await ldb.insert(reader, i);
        }
      }
    }
    else {
      for (var reader in rs) {
        for (var i = 0; i < reader.url.length; i++) {
          var p = await ldb.FindSoraByName(reader.soraName[i]);
          for (var x in p) {
            if (!(reader.readerName == x["name"] && reader.soraName[i] == x["soraname"])) {
              if(reader.soraName[i] != x["soraname"]){
                await ldb.insert(reader, i);
              }
            }
          }
        }
      }
    }
  }

  Future<List<Sora>> getSora(sora) async {
    List<Sora> sors = [];
    var suggestions = await ldb.FindSoraByName(sora);
    for (var sgn in suggestions) {
      sors.add(Sora.fromJson(sgn));
    }
    return sors;
  }

  Future<void> setFavSora(context) async {
    var suggestions = await ldb.FindSoraByIsFav("true");

    for (var sgn in suggestions) {
    print( Random().nextInt(100));
    Provider.of<ReaderP>(context,listen: false).FavSora.add(Sora.fromJson(sgn));
    }

  }
}
