import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:japan_music_app/models/music.dart';
import 'package:japan_music_app/pages/detail_page.dart';
import 'package:japan_music_app/stylings/custom_styling.dart';

class MusicGrid extends StatelessWidget {
  final int gridCount;

  MusicGrid({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: musicList.map((music) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailPage(music: music);
                }));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 8),
                    Center(
                      child: Text(
                        music.title,
                        style: titleStyle,
                      ),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: Image.asset(
                        music.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class MusicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final Music music = musicList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(music: music);
              }));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                    child: Image.asset(
                      music.imageAsset,
                      fit: BoxFit.fitWidth,
                      height: 250,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            music.title,
                            style: titleStyle,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 10),
                              Icon(CupertinoIcons.pencil_outline,color: lightRedColor, size: 20),
                              SizedBox(width: 10),
                              Text(music.titleJapan, style: regulerTextMobileStyle)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 10),
                              Icon(CupertinoIcons.calendar,color: lightRedColor, size: 20),
                              SizedBox(width: 10),
                              Text(
                                  DateFormat.yMMMMd().format(
                                      DateFormat('yyyy.MM.dd')
                                          .parse(music.released)),
                                  style: regulerTextMobileStyle)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 10),
                              Icon(CupertinoIcons.music_mic,color: lightRedColor, size: 20),
                              SizedBox(width: 10),
                              Text(music.songWriter, style: regulerTextMobileStyle)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 10),
                              Icon(CupertinoIcons.tag,color: lightRedColor, size: 20),
                              SizedBox(width: 10),
                              Text(music.genre, style: regulerTextMobileStyle)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 10),
                              Icon(CupertinoIcons.music_house,color: lightRedColor, size: 20),
                              SizedBox(width: 10),
                              Text(music.label, style: regulerTextMobileStyle)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 10),
                              Icon(CupertinoIcons.star_fill,color: lightRedColor, size: 20),
                              SizedBox(width: 10),
                              Text(music.rating.toString(),
                                  style: regulerTextMobileStyle)
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: musicList.length,
      ),
    );
  }
}
