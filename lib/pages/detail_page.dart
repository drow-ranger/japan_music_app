import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:japan_music_app/models/music.dart';
import 'package:japan_music_app/stylings/custom_styling.dart';
import 'package:just_audio/just_audio.dart';

final player = AudioPlayer();

class DetailPage extends StatelessWidget {
  final Music music;

  DetailPage({required this.music});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(music: music);
        } else {
          return DetailMobilePage(music: music);
        }
      },
    );
  }
}

// ignore: must_be_immutable
class DetailMobilePage extends StatelessWidget {
  final Music music;

  DetailMobilePage({required this.music});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightGreyColor,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              CupertinoIcons.chevron_back,
              size: 20,
              color: darkGreyColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text(
          music.title,
          style: subTitleStyle,
        ),
        actions: [FavoriteButton()],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(music.imageAsset),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Information', style: subTitleStyle),
                      Text(
                        music.information,
                        textAlign: TextAlign.justify,
                        style: header1TextStyle,
                      )
                    ])),
            Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.only(left: 64.0, bottom: 16.0),
              decoration: BoxDecoration(
                  color: lightGreyColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.pencil_outline,
                        color: lightRedColor,
                        size: 28.0,
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Title In Japan', style: header2TextStyle),
                          Text(music.titleJapan, style: header1TextStyle)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.calendar,
                        color: lightRedColor,
                        size: 28.0,
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date Released', style: header2TextStyle),
                          Text(
                              DateFormat.yMMMMd().format(
                                  DateFormat('yyyy.MM.dd')
                                      .parse(music.released)),
                              style: header1TextStyle)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.music_mic,
                        color: lightRedColor,
                        size: 28.0,
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Song Writer', style: header2TextStyle),
                          Text(music.songWriter, style: header1TextStyle)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.tag,
                        color: lightRedColor,
                        size: 28.0,
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Genre', style: header2TextStyle),
                          Text(music.genre, style: header1TextStyle)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.music_house,
                        color: lightRedColor,
                        size: 28.0,
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Label Music', style: header2TextStyle),
                          Text(music.label, style: header1TextStyle)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.star_fill,
                        color: lightRedColor,
                        size: 28.0,
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Rating', style: header2TextStyle),
                          Text(music.rating.toString(), style: header1TextStyle)
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
                height: (70 * music.track.length).toDouble(),
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(right: 64.0, bottom: 16.0),
                decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16))),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: music.track.map((track) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () async {
                                await player.setAsset("audio/$track.m4a");
                                await player.pause();
                                player.play();
                              },
                              icon: Icon(
                                CupertinoIcons.play_fill,
                                color: lightRedColor,
                                size: 24.0,
                              )),
                          SizedBox(width: 8),
                          Flexible(
                            child: new Container(
                              child: new Text(
                                "${music.track.indexOf(track) + 1}.  $track",
                                overflow: TextOverflow.ellipsis,
                                style: header2TextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ))
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final Music music;

  DetailWebPage({required this.music});

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightGreyColor,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              CupertinoIcons.chevron_back,
              size: 20,
              color: darkGreyColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text(
          widget.music.title,
          style: subTitleStyle,
        ),
        actions: [FavoriteButton()],
      ),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 64,
          ),
          child: Container(
            width: screenWidth <= 1200 ? 800 : screenWidth - 200,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            child: Image.asset(widget.music.imageAsset,
                                height: screenHeight - 100),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 64),
                    Expanded(
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Information",
                                style: subTitleStyle,
                              ),
                              Container(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  widget.music.information,
                                  textAlign: TextAlign.justify,
                                  style: regulerTextWebStyle,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    right: 16.0,
                                    left: 16.0,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.pencil_outline,
                                      color: lightRedColor,
                                      size: 28.0,
                                    ),
                                    SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Title In Japan', style: header2TextStyle),
                                        Text(widget.music.titleJapan, style: header1TextStyle)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                padding: EdgeInsets.only(
                                  right: 16.0,
                                  left: 16.0,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.calendar,
                                      color: lightRedColor,
                                      size: 28.0,
                                    ),
                                    SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Date Released', style: header2TextStyle),
                                        Text(
                                            DateFormat.yMMMMd().format(
                                                DateFormat('yyyy.MM.dd')
                                                    .parse(widget.music.released)),
                                            style: header1TextStyle)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                padding: EdgeInsets.only(
                                  right: 16.0,
                                  left: 16.0,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.music_mic,
                                      color: lightRedColor,
                                      size: 28.0,
                                    ),
                                    SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Song Writer', style: header2TextStyle),
                                        Text(widget.music.songWriter, style: header1TextStyle)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                padding: EdgeInsets.only(
                                  right: 16.0,
                                  left: 16.0,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.tag,
                                      color: lightRedColor,
                                      size: 28.0,
                                    ),
                                    SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Genre', style: header2TextStyle),
                                        Text(widget.music.genre, style: header1TextStyle)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                padding: EdgeInsets.only(
                                  right: 16.0,
                                  left: 16.0,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.music_house,
                                      color: lightRedColor,
                                      size: 28.0,
                                    ),
                                    SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Label Music', style: header2TextStyle),
                                        Text(widget.music.label, style: header1TextStyle)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                padding: EdgeInsets.only(
                                  right: 16.0,
                                  left: 16.0,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.star_fill,
                                      color: lightRedColor,
                                      size: 28.0,
                                    ),
                                    SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Rating', style: header2TextStyle),
                                        Text(widget.music.rating.toString(), style: header1TextStyle)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 32),
                              Text(
                                "Track List",
                                style: subTitleStyle,
                              ),
                              Container(
                                  height: (70 * widget.music.track.length).toDouble(),
                                  padding: EdgeInsets.all(16.0),
                                  child: ListView(
                                    scrollDirection: Axis.vertical,
                                    children: widget.music.track.map((track) {
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          children: [
                                            IconButton(
                                                onPressed: () async {
                                                  await player.setAsset("audio/$track.m4a");
                                                  await player.pause();
                                                  player.play();
                                                },
                                                icon: Icon(
                                                  CupertinoIcons.play_fill,
                                                  color: lightRedColor,
                                                  size: 24.0,
                                                )),
                                            SizedBox(width: 8),
                                            Flexible(
                                              child: new Container(
                                                child: new Text(
                                                  "${widget.music.track.indexOf(track) + 1}.  $track",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: header2TextStyle,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: lightRedColor,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
