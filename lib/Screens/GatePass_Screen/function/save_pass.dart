import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';


// String AppQr = "${appName}QR";
Future<String> savePass(String passName,Uint8List bytes) async{
  print("save Image");
  await [Permission.storage].request();
   final result = await ImageGallerySaver.saveImage(bytes, name: passName );
  // final result = await ImageGallerySaver.saveFile(file)
  print(result);
  return result['filePath'];
}