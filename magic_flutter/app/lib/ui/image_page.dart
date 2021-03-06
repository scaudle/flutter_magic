import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:app/app_data.dart';


class ImagePage extends StatelessWidget {
  final String url;

  const ImagePage({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title:new Text(this.url) ),
      body:imageView(context)
    );
  }

  imageView(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height - 120.0;
    double screenWidth=MediaQuery.of(context).size.width;//- 120.0;

    appData.logEvent('images_show', {'ep':appData.getCurrEndPoint().endpointTitle, 'image_src':url});

    return new Container(
        child: new PhotoView(
          size:Size.fromHeight(screenWidth),
          imageProvider: NetworkImage(url),
          minScale: PhotoViewComputedScale.contained * 0.3,
          maxScale: 3.0,
        )
    );
  }


}
