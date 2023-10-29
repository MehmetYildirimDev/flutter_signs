import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_signs/data/strings.dart';
import 'package:flutter_signs/model/signModel.dart';

class SignList extends StatelessWidget {
  late List<Sign> allSigns;
  SignList() {
    List<Sign> allSigns = prepareDataSource();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign List')),
      body: const Center(
        child: Text('Burc Listesi'),
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
        smallPicture: '${Strings.BURC_ADLARI[i].toLowerCase()}${i + 1}.png)',
        largePicture:
            '${Strings.BURC_ADLARI[i].toLowerCase()}_buyuk${i + 1}.png)',
      );
      tempList.add(signToAdd);
    }
    return tempList;
  }
}
