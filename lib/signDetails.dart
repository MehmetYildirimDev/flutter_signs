import 'package:flutter/material.dart';
import 'package:flutter_signs/model/signModel.dart';
import 'package:palette_generator/palette_generator.dart';

class SignDetail extends StatefulWidget {
  final Sign selectedSign;
  const SignDetail({required this.selectedSign, super.key});

  @override
  State<SignDetail> createState() => _SignDetailState();
}

class _SignDetailState extends State<SignDetail> {
  Color appBarColor = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        appBarFoundColor()); //daha hizli calsimasi icin //once buildi yapiyor daha sonra diger islemleri yapiyor
    appBarFoundColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250, //uygulama acildiginda ne kadar yer tutsun
            pinned: true, //sabit bir sekilde kalsin
            backgroundColor: appBarColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('${widget.selectedSign.name} Ozellikleri'),
              centerTitle: true,
              background: Image.asset(
                "assets/images/${widget.selectedSign.largePicture}",
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
                child: Text(
                  widget.selectedSign.detail,
                  style: Theme.of(context).textTheme.bodyText1,
                  //style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void appBarFoundColor() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('assets/images/${widget.selectedSign.largePicture}'));
    appBarColor = _generator.dominantColor!.color;
    print(appBarColor);
    //buildi guncelliyor
    setState(() {});
  }
}
