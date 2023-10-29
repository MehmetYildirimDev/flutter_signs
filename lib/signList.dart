import 'package:flutter/material.dart';
import 'package:flutter_signs/data/strings.dart';
import 'package:flutter_signs/model/signModel.dart';
import 'package:flutter_signs/signItem.dart';

class SignList extends StatelessWidget {
  late final List<Sign> allSigns;
  SignList() {
    allSigns = prepareDataSource();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign List')),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return SignItem(listedSign: allSigns[index]);
          },
          itemCount: allSigns.length,
        ),
      ),
    );
  }

  final int signCount = 12;
  List<Sign> prepareDataSource() {
    List<Sign> tempList = [];
    for (var i = 0; i < signCount; i++) {
      Sign signToAdd = Sign(
        name: Strings.BURC_ADLARI[i],
        date: Strings.BURC_TARIHLERI[i],
        detail: Strings.BURC_GENEL_OZELLIKLERI[i],
        smallPicture: '${Strings.BURC_ADLARI[i].toLowerCase()}${i + 1}.png',
        largePicture:
            '${Strings.BURC_ADLARI[i].toLowerCase()}_buyuk${i + 1}.png',
      );
      tempList.add(signToAdd);
    }
    return tempList;
  }
}
