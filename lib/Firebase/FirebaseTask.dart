import 'dart:convert';

import 'package:audioplayer/LocalDatabase/Databasehelper.dart';
import 'package:audioplayer/LocalDatabase/LDbase.dart';
import 'package:audioplayer/Providers/ReaderProvider.dart';
import 'package:audioplayer/LocalDatabase/Reader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class FirebaseTask {
  static final _db = FirebaseFirestore.instance;


  GetSora(context) async{

   await  _db
        .collection("reders")
        .get()
        .then((value) => value.docs.forEach((element){
              Provider.of<ReaderP>(context,listen: false).reader.add(
                Reader.fromJson(element)
              );
            }));
    Provider.of<ReaderP>(context,listen: false).ChangeReader();
    await LDBase().insertReader(Provider.of<ReaderP>(context,listen: false).reader);





  }
}
