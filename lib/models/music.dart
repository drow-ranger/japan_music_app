class Music {
  String title;
  String titleJapan;
  String released;
  String genre;
  String label;
  String information;
  String songWriter;
  String music;
  String arrangement;
  String imageAsset;
  List<String> track;
  num rating;
  bool favoriteStatus;

  Music({
    required this.title,
    required this.titleJapan,
    required this.released,
    required this.genre,
    required this.label,
    required this.information,
    required this.songWriter,
    required this.music,
    required this.arrangement,
    required this.imageAsset,
    required this.track,
    required this.rating,
    required this.favoriteStatus,
  });
}

var musicList = [
  Music(
      title: "Good-bye My Loneliness",
      titleJapan: "Good-bye My Loneliness",
      released: "1991.02.10",
      genre: "Pop rock",
      label: "B-Gram Records",
      information:
          "\"Good-bye My Loneliness\" is ZARD's debut single. The title track was used as the theme song for the Fuji TV dorama Kekkon no Risou to Genjitsu. The single reached #9 on the weekly Oricon charts, charted for fifteen weeks and sold 209,460 units, becoming the #69 single of 1991.",
      songWriter: "Sakai Izumi",
      music: "Oda Tetsuro",
      arrangement: "Akashi Masao",
      imageAsset:
          "images/Good-bye_My_Loneliness_single.jpg",
      track: [
        "Good-bye My Loneliness",
        "Ai wa Kurayami no Naka de (愛は暗闇の中で; Love is Inside the Darkness)"
      ],
      rating: 4.9,
      favoriteStatus: false),
  Music(
      title: "Fushigi ne...",
      titleJapan: "不思議ね…",
      released: "1991.06.25",
      genre: "Pop rock",
      label: "B-Gram Records",
      information:
          "\"Fushigi ne...\" is ZARD's second single. The title track was used as a theme song for the Nihon TV quiz show Magical Zunou Power!!. The single reached #30 on the Oricon, charted for five weeks and sold 31,090 units.",
      songWriter: "Sakai Izumi",
      music: "Oda Tetsuro",
      arrangement: "Akashi Masao",
      imageAsset: "images/Fushigi_ne....jpg",
      track: [
        "Fushigi ne... (不思議ね…; It's a Miracle)",
        "Sunao ni Ienakute (素直に言えなくて)"
      ],
      rating: 4.5,
      favoriteStatus: false),
  Music(
      title: "Makenaide",
      titleJapan: "負けないで",
      released: "1993.01.27",
      genre: "Pop rock",
      label: "B-Gram Records",
      information:
          "\"Makenaide\" is ZARD's sixth single. The title song was used as the theme song for the Fuji TV dorama Shiratori Reiko de Gozaimasu!. The single reached #1 on the Oricon, charted for eighteen weeks and sold 1,645,010 units, becoming the #6 single of 1993. This is ZARD's best selling single.\nZARD performed this song on Music Station in February 5, 1993. This was their last appearance on the show, and also the last work of ZARD as a five member group, as the other members all retired afterwards.",
      songWriter: "Sakai Izumi",
      music: "Oda Tetsuro",
      arrangement: "Hayama Takeshi",
      imageAsset: "images/Makenaide.jpg",
      track: [
        "Makenaide (負けないで; Don't Lose)",
        "Stray Love",
      ],
      rating: 4.8,
      favoriteStatus: false),
  Music(
      title: "Yureru Omoi",
      titleJapan: "揺れる想い",
      released: "1993.05.19",
      genre: "Pop rock",
      label: "B-Gram Records",
      information:
          "\"Yureru Omoi\" is ZARD's eighth single. The title track was used as the \"Pocari Sweat\" CM song. It reached #1 on the weekly Oricon charts, charted for twenty weeks and sold 1,396,420 units, becoming the #9 single of 1993.",
      songWriter: "Sakai Izumi",
      music: "Oda Tetsuro",
      arrangement: "Akashi Masao",
      imageAsset:
          "images/Yureru_Omoi_single.jpg",
      track: [
        "Yureru Omoi (揺れる想い; Shaking Memories)",
        "Just for you",
      ],
      rating: 4.9,
      favoriteStatus: false),
  Music(
      title: "Kitto Wasurenai",
      titleJapan: "きっと忘れない",
      released: "1993.11.03",
      genre: "Pop rock",
      label: "B-Gram Records",
      information:
          "\"Kitto Wasurenai\" is ZARD's tenth single. The title tracl was used as the theme song for the second season of the Fuji TV dorama Shiratori Reiko de Gozaimasu!. It reached #1 on the weekly Oricon charts and sold 532,200 units, becoming the #53 single of 1993. It also sold 339,930 units in 1994, becoming the #81 single of that year. This single charted for fifteen weeks and sold a total of 872,130 copies.",
      songWriter: "Sakai Izumi",
      music: "Oda Tetsuro",
      arrangement: "Akashi Masao",
      imageAsset: "images/Kitto_Wasurenai.jpg",
      track: [
        "Kitto Wasurenai (きっと忘れない; Surely You Won't Forget)",
        "Tasogare ni My Lonely Heart (黄昏にMy Lonely Heart)",
      ],
      rating: 4.5,
      favoriteStatus: false),
  Music(
      title: "Kokoro wo Hiraite",
      titleJapan: "心を開いて",
      released: "1996.05.06",
      genre: "Pop rock",
      label: "B-Gram Records",
      information:
          "\"Kokoro wo Hiraite\" is ZARD's 18th single. The title song was used as the \"Pocari Sweat\" CM song. It reached #1 on the weekly Oricon charts, charted for fifteen weeks and sold 746,990 units, becoming the #32 single of 1996.",
      songWriter: "Sakai Izumi",
      music: "Oda Tetsuro",
      arrangement: "Ikeda Daisuke",
      imageAsset:
          "images/Kokoro_wo_Hiraite.jpg",
      track: [
        "Kokoro wo Hiraite (心を開いて; Open Your Heart)",
        "Change my mind",
      ],
      rating: 4.7,
      favoriteStatus: false),
  Music(
      title: "Don't you see!",
      titleJapan: "Don't you see!",
      released: "1997.01.06",
      genre: "Pop rock",
      label: "B-Gram Records",
      information:
          "\"Don't you see!\" is ZARD's 19th single. The title song was used as the second ending theme for the Fuji TV anime Dragon Ball GT. The single reached #1 on the weekly Oricon charts, charted for fifteen weeks and sold 602,760 units, becoming the #46 single of 1997.",
      songWriter: "Sakai Izumi",
      music: "Kuribayashi Seiichiro",
      arrangement: "Hayama Takeshi",
      imageAsset:
          "images/Don't_you_see!.jpg",
      track: [
        "Don't you see!",
        "Kaeranu Toki no Naka de (帰らぬ時間（とき）の中で)",
      ],
      rating: 4.9,
      favoriteStatus: false),
  Music(
      title: "Robinson ",
      titleJapan: "ロビンソン",
      released: "1995.04.05",
      genre: "Pop rock",
      label: "Polydor Records",
      information:
      "\"Robinson\" is the 11th single released by Spitz. The title track was used as ending theme song for the TV show Imada Kouji no Shibuya Kei Ura Ringo. In 1996 the song was also used as insert song for the drama Hakusen Nagashi and in 2001 it was used as Kirin Gogo no Koucha CM theme song. The single was released in a LP format four months later, including their 12th single, \"Namida ga Kirari☆\", as B-side. The single reached #4 on Oricon charts, and charted for 36 weeks. As it sold 1,594,310 copies in 1995 it become the #9 single of the year.",
      songWriter: "Spitz",
      music: "Spitz",
      arrangement: "Spitz",
      imageAsset:
      "images/Robinson.jpg",
      track: [
        "Robinson (ロビンソン)",
        "Ore no Subete (俺のすべて)",
      ],
      rating: 4.7,
      favoriteStatus: false),
];
