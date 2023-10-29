import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signs/model/signModel.dart';
import 'package:flutter_signs/signDetails.dart';

class SignItem extends StatelessWidget {
  final Sign listedSign;
  const SignItem({required this.listedSign, super.key});

  @override
  Widget build(BuildContext context) {
    var myTextStlye = Theme.of(context).textTheme; 
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: (){
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SignDetail(selectedSign: listedSign),
              ),);
            },
            leading: Image.asset( 
              "assets/images/${listedSign.smallPicture}",
            ),
            title: Text(listedSign.name,style: myTextStlye.headline5,),
            subtitle: Text(listedSign.date, style: myTextStlye.subtitle1,),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}
