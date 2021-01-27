import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:fluro/fluro.dart';
// import 'package:bbsync/config/application.dart';
// import 'package:bbsync/widget/custom_route.dart';

import 'dart:io';
// import 'dart:async';

// import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_manager/photo_manager.dart';

import 'package:sticky_infinite_list/sticky_infinite_list.dart';

class TabHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主页'),
      ),
      body: PhotoAlbumResourceWidget(),
      // body: new Container(
      //   alignment: Alignment.center,
      //   child: RaisedButton(
      //     onPressed: () async {
      //       // Navigator.pushNamed(context, '/detail');
      //       // Navigator.push(context, CustomRoute7(child: Detail()));
      //       /**
      //        * nativeModal,
      //           inFromLeft,
      //           inFromTop,
      //           inFromRight,
      //           inFromBottom,
      //           fadeIn,
      //           custom,
      //           material,
      //           materialFullScreenDialog,
      //           cupertino,
      //           cupertinoFullScreenDialog,
      //        */
      //       // Application.router.navigateTo(
      //       //   context,
      //       //   '/detail',
      //       //   transition: TransitionType.cupertino,
      //       //   transitionDuration: const Duration(seconds: 4),
      //       // );
      //       Fluttertoast.showToast(msg: '权限已获取2222');
      //       // PermissionStatus status =
      //       //     await PhotoAlbumManager.checkPermissions();
      //       var result = await PhotoManager.requestPermission();
      //       if (result) {
      //         Fluttertoast.showToast(msg: '权限已获取2');
      //         List<AssetPathEntity> list =
      //             await PhotoManager.getAssetPathList();
      //         print('===========');
      //         AssetPathEntity data = list[0];
      //         List<AssetEntity> imageList = await data.assetList;
      //         AssetEntity entity = imageList[1];
      //         String mediaUrl = await entity.getMediaUrl();
      //         print(entity);
      //       } else {
      //         Fluttertoast.showToast(msg: '权限未获取2');
      //       }
      //     },
      //     child: Text(
      //       'screen',
      //       style: TextStyle(fontSize: 30),
      //     ),
      //   ),
      // ),
    );
  }
}

// class PhotoAlbumBodyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return InfiniteList(
//       posChildCount: 10,
//       builder: (context, index) {
//         return InfiniteListItem(
//           headerBuilder: (BuildContext context) {
//             return Container(
//               width: 100,
//               height: 100,
//               margin: EdgeInsets.all(10),
//               decoration: new BoxDecoration(
//                 color: Colors.red,
//                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
//               ),
//               alignment: Alignment.center,
//               child: new Text('$index'),
//             );
//           },
//           contentBuilder: (BuildContext context) {
//             return Container(
//               width: MediaQuery.of(context).size.width,
//               height: 600,
//               color: Colors.pink,
//             );
//           },
//         );
//       },
//     );
//   }
// }

class PhotoAlbumResourceWidget extends StatefulWidget {
  final List photos;
  final List imageList;
  final File file;

  const PhotoAlbumResourceWidget(
      {Key key, this.photos, this.imageList, this.file})
      : super(key: key);

  @override
  PhotoAlbumResourceWidgetState createState() =>
      new PhotoAlbumResourceWidgetState();
}

class PhotoAlbumResourceWidgetState extends State<PhotoAlbumResourceWidget> {
  List<AssetPathEntity> photos = List();
  List<AssetEntity> imageList = List();

  File file;

  Uint8List imageData;

  @override
  Widget build(BuildContext context) {
    return InfiniteList(
      posChildCount: this.imageList.length,
      builder: (context, index) {
        return InfiniteListItem(
          headerBuilder: (BuildContext context) {
            return Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(10),
              decoration: new BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              alignment: Alignment.center,
              child: new Text('${this.photos[index].name}'),
            );
          },
          contentBuilder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 600,
              color: Colors.pink,
              // child: Image.file(
              //   this.file,
              // ),
              // child: Text(this.file.path),
              child: Image.memory(
                this.imageData,
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
              // child: Image.asset(
              //   this.file.path,
              //   width: 100,
              //   height: 100,
              //   fit: BoxFit.fill,
              // ),
              // child: Image(image: AssetImage(this.file.path)),
            );
          },
        );
      },
    );
  }

  @override
  // ignore: missing_return
  Future<void> initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    FilterOptionGroup filterOptionGroup = FilterOptionGroup()
      ..dateTimeCond = DateTimeCond(
        min: DateTime.utc(0), // Too narrow time
        max: DateTime.now(),
        // asc: true,
      );
    FilterOption filterOption = FilterOption(
      sizeConstraint: SizeConstraint(ignoreSize: true),
    );
    filterOptionGroup.setOption(AssetType.image, filterOption);
    this.photos = await PhotoManager.getAssetPathList(
      // hasAll: true,
      onlyAll: true,
      type: RequestType.image,
      filterOption: filterOptionGroup,
    );
    AssetPathEntity data = this.photos[0];
    this.imageList = await data.assetList;
    AssetEntity entity = this.imageList[0];
    this.file = await entity.file;
    this.imageData = await entity.originBytes;
    // String mediaUrl = await entity.getMediaUrl();
    print('=====');
    print(this.file.path);
    setState(() {});
  }
}
