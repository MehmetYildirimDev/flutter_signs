import 'package:flutter/material.dart';
import 'package:flutter_signs/model/signModel.dart';

class SignDetail extends StatelessWidget {
  final Sign selectedSign;
  const SignDetail({required this.selectedSign, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250, //uygulama acildiginda ne kadar yer tutsun
            pinned: true, //sabit bir sekilde kalsin
            backgroundColor: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('${selectedSign.name} Ozellikleri'),
              centerTitle: true,
              background: Image.asset(
                "assets/images/${selectedSign.largePicture}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          //sliver yapiyor kutu icine alarak
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                //yazilar yeterli uzunlukta gelmedi daha sonra px artirim nasil gorundugune bakabilirisin
                child: Text(
                  selectedSign.detail,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
