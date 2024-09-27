import 'dart:developer';

import 'package:dio/dio.dart';

String duration = "";

class HelperFuncation {
  final dio = Dio();

  Future<void> getAllVideosFormPlayListYT() async {
    final request = await dio.get(
        'https://www.googleapis.com/youtube/v3/videos?part=id%2Csnippet%2CcontentDetails&id=kb-_GbpH3sQ&t=8897s&key=AIzaSyCLTGazN_J6ULDtzvyBkfxccXp-73oMqQs');
    duration = await request.data["items"][0]["contentDetails"]["duration"];
    log(duration);
    log(duration.length.toString());
    if(duration.contains("H")){
      log("hours");
    }else if ( duration.length==10) {
      log("minutes");
      
    }
  }
}
