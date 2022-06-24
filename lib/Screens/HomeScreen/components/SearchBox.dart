import 'package:audioplayer/LocalDatabase/LDbase.dart';
import 'package:audioplayer/LocalDatabase/Reader.dart';
import 'package:audioplayer/Providers/ReaderProvider.dart';
import 'package:audioplayer/Screens/HomeScreen/components/SoraCard.dart';
import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SD.screenHeight * 1 / 4,
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: SD().PropHeight(30),
            ),
            Text(
              "   إبحث عن السورة 😄",
              style: TextStyle(
                fontSize: SD().PropWidth(20),
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextField(
                key: Provider.of<ReaderP>(context).filedKey,
                controller: Provider.of<ReaderP>(context).searchCont,
                decoration: buildInputDecoration(),

                onSubmitted: (val)async{
                  FocusScope.of(context).requestFocus(FocusNode());
                  Provider.of<ReaderP>(context,listen: false).showSuggs(Container());
                },
                onChanged: (text)async{
                  if(text!=""){
                    List<Sora>sgn= await LDBase().getSora(text);
                    var list = SoraCard(sgn,context);
                    Provider.of<ReaderP>(context,listen: false).showSuggs(list);
                  }else{
                    Provider.of<ReaderP>(context,listen: false).showSuggs(Container());
                  }
                },
              ),

            SizedBox(
              height: SD().PropHeight(20),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      hintText: "أدخل اسم السورة",
      contentPadding: EdgeInsets.only(right: SD().PropWidth(20),bottom: 5),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Color(0xff100e0e), width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Color(0xff070606), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff070606), width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      fillColor: Colors.white,
      filled: true,
    );
  }
}
