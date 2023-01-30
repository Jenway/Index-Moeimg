import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SiteContainer extends StatelessWidget {
  // 构造方法，设置传参
  const SiteContainer({
    super.key,
    required this.title,
    required this.src,
  });
  final String title, src;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: CachedNetworkImageProvider(
              src,
            ),
          ),
        ),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            ListTile(
              subtitle: Text(
                title,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                      blurRadius: 1,
                    ),
                  ],
                  // backgroundColor: Color.fromARGB(125, 0, 0, 0),
                ),
              ),
            ),
          ],
        ));
  }
}
