import 'dart:async';

import 'package:an_core_network/an_core_network.dart';
import 'package:an_core_ui/an_core_ui.dart';

class DownloadFileService {
  Future<List<String>> parseMasterM3u8(String m3u8Url) async {
    final response = await Dio().get(m3u8Url);
    final lines = response.data.toString().split('\n');

    // Get the base URL of the master playlist
    final baseUrl = m3u8Url.substring(0, m3u8Url.lastIndexOf('/') + 1);

    // Extract variant playlist URLs
    final variantUrls = lines
        .where((line) => line.contains('.m3u8')) // Look for lines with .m3u8
        .map((line) => line.startsWith('http') ? line : baseUrl + line) // Prepend base URL if relative
        .toList();

    return variantUrls;
  }

  Future<List<String>> parseVariantM3u8(String variantUrl) async {
    final response = await Dio().get(variantUrl);
    final lines = response.data.toString().split('\n');

    // Extract lines containing .ts segments
    final tsLines = lines.where((line) => line.contains('.ts')).toList();

    // Get the base URL of the variant playlist
    final baseUrl = variantUrl.substring(0, variantUrl.lastIndexOf('/') + 1);

    // Construct full URLs for .ts segments
    final tsUrls = tsLines.map((line) => baseUrl + line).toList();

    return tsUrls;
  }

  Future<String> downloadTsFile(String tsUrl) async {
    final directory = await getApplicationDocumentsDirectory();

    // Extract the filename without query parameters
    final tsFileName = tsUrl.split('/').last.split('?').first;

    // Ensure the file has a .ts extension
    final tsPath = '${directory.path}/${DateTime.now().toIso8601String()}_$tsFileName';

    // Download the .ts file
    await Dio().download(tsUrl, tsPath);
    return tsPath; // Return the local path of the downloaded .ts file
  }

  Future<String> downloadImage(String imageUrl) async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/${imageUrl.split('/').last}';
    await Dio().download(imageUrl, imagePath);
    return imagePath;
  }
}
