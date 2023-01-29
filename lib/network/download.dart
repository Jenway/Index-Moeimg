import 'package:dio/dio.dart';

// create a class for dowoloading pictures from the internet
class Download {
  // create a function for downloading pictures from the internet
  Future<void> downloadFile(String url, String savePath) async {
    try {
      // create a dio object
      Dio dio = Dio();
      // download pictures from the internet
      await dio.download(url, savePath,
          onReceiveProgress: showDownloadProgress);
    
    } catch (e) {
      // print(e);
    }
  }

  // create a function for showing the progress of the download
  void showDownloadProgress(received, total) {
    if (total != -1) {
      // print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }
}



