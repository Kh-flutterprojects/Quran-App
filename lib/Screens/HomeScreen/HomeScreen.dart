import 'package:audioplayer/Firebase/FirebaseTask.dart';
import 'package:audioplayer/LocalDatabase/LDbase.dart';
import 'package:audioplayer/LocalDatabase/Reader.dart';
import 'package:audioplayer/Providers/ReaderProvider.dart';
import 'package:audioplayer/Screens/HomeScreen/components/FavoriteBox.dart';
import 'package:audioplayer/Screens/HomeScreen/components/ReaderBox.dart';
import 'package:audioplayer/Screens/HomeScreen/components/SearchBox.dart';
import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/AppDrawer.dart';

class HomeScreen extends StatelessWidget {

  Future<void> GetData(BuildContext context) async {
    SD().init(context);
    if(!Provider.of<ReaderP>(context).isLoded)  {
      FirebaseTask().GetSora(context);
      Provider.of<ReaderP>(context).isLoded=true;
      await LDBase().setFavSora(context);
    }

  }
  @override
  Widget build(BuildContext context) {
    //GetData(context);
    return  Scaffold(
        drawer: AppDrawer(context),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child:Container(
          decoration: BoxDecoration(
           color:Color(0xff140d2a),
          ),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    SearchBox(),
                    ReaderBox(),
                  ],
                ),
                Provider.of<ReaderP>(context).suggsList,
              ],
            ),
          )
        ),
      ),
    );
  }




}
