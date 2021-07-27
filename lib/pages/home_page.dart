import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:japan_music_app/stylings/custom_styling.dart';
import 'package:japan_music_app/widgets/music_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: lightGreyColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: RichText(
                text: TextSpan(
                    text: 'Japan',
                    style: titleStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Music',
                          style: subTitleStyle
                      )
                    ])),
            actions: [
              IconButton(
                  icon: Icon(CupertinoIcons.clear_fill, size: 20, color: darkGreyColor,),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return MusicList();
              } else if (constraints.maxWidth <= 1200) {
                return MusicGrid(gridCount: 4);
              } else {
                return MusicGrid(gridCount: 6);
              }
            },
          ),
        );
      },
    );
  }
}
