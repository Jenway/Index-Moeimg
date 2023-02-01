import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:index/common/global.dart';
import 'package:photo_view/photo_view.dart';
import 'package:index/network/download.dart';

class PicPage extends StatefulWidget {
  const PicPage(
      {super.key, required this.picAddress, this.picSource = 'pic_page'});
  final List<String> picAddress;
  final String picSource;
  @override
  State<PicPage> createState() => _PicPageState();
}

class _PicPageState extends State<PicPage> {
  void showDetail({
    required String picAddress,
    required String picName,
  }) {
    showDialog(
      context: context,
      builder: (context) => Scaffold(
        body: Center(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: PhotoView(
                  imageProvider: CachedNetworkImageProvider(picAddress),
                  backgroundDecoration:
                      const BoxDecoration(color: Colors.transparent),
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 2,
                  initialScale: PhotoViewComputedScale.contained,
                  heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
                  enableRotation: true,
                ),
              ),
              Positioned(
                //右上角关闭按钮
                right: 10,
                top: MediaQuery.of(context).padding.top,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(children: [
                  Text(picAddress),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(children: [
                  Text(picAddress),
                ]),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Center(
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.download),
                        onPressed: () {
                          Download().downloadFile(
                            picAddress,
                            '$downloadPath${widget.picSource}_$picName.jpg',
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pics = [];

    final int picNum = widget.picAddress.length;
    for (var i = 0; i < picNum; i++) {
      pics.add(InkWell(
        onLongPress: () {
          showDetail(picAddress: widget.picAddress[i], picName: i.toString());
        },
        onTap: () {
          showDetail(picAddress: widget.picAddress[i], picName: i.toString());
        },
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url, progress) =>
              RefreshProgressIndicator(value: progress.progress),
          imageUrl: widget.picAddress[i],
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ));
    }
    // DownloadPicture dl=DownloadPicture(picAddress: widget.picAddress);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 72, 123, 180),
        title: Text(
          widget.picSource,
          style: const TextStyle(fontSize: 18.0),
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
        actions: <Widget>[
          const IconButton(onPressed: null, icon: Icon(Icons.safety_check)),
          PopupMenuButton<String>(
            itemBuilder: (context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: '行数',
                  child: Text('行数'),
                ),
                const PopupMenuItem<String>(
                  value: '收藏',
                  child: Text('收藏'),
                ),
                const PopupMenuItem<String>(
                  value: '下载全部',
                  onTap: null,
                  child: Text('下载全部'),
                ),
              ];
            },
          )
        ],
      ),
      body: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        children: pics,
      ),
    );
  }
}
