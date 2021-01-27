// import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:fluro/fluro.dart';
// import 'package:bbsync/config/application.dart';
// import 'package:bbsync/widget/custom_route.dart';

// import 'dart:io';
// import 'dart:async';

// import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_manager/photo_manager.dart';

// import 'package:sticky_infinite_list/sticky_infinite_list.dart';

class TabHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主页'),
      ),
      body: MediaGrid(),
    );
  }
}

class MediaGrid extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MediaGridState();
}

class _MediaGridState extends State<MediaGrid> {
  List<Widget> mediaList = [];

  @override
  void initState() {
    super.initState();
    _fetchMedia();
  }

  _fetchMedia() async {
    var result = await PhotoManager.requestPermission();
    if (result) {
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        onlyAll: true,
        type: RequestType.image,
      );
      // List<AssetEntity> media = await albums[0].assetList;
      List<AssetEntity> media = await albums[0].assetList;
      List<Widget> widgets = [];
      print(media.length);
      for (var asset in media) {
        widgets.add(FutureBuilder(
          future: asset.thumbDataWithSize(200, 200),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(192, 192, 192, 0.6),
                      ),
                      child: Image.memory(
                        snapshot.data,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ));
      }
      setState(() {
        mediaList.addAll(widgets);
      });
    } else {
      Fluttertoast.showToast(msg: '获取授权失败');
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      // onNotification: (ScrollNotification scroll) {
      //   _handleScrollEvent(scroll);
      //   return;
      // },
      child: GridView.builder(
        itemCount: mediaList.length,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: mediaList[index],
          );
        },
      ),
    );
  }
}
