import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/app/services/car_service.dart';
import 'package:flutter/material.dart';

class KImage extends StatelessWidget {
  final String url;
  final BoxFit fit;
  const KImage({
    Key? key,
    required this.url,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CarService.to.getImageUrl(url),
      builder: (context, AsyncSnapshot<String> s) {
        if (s.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (s.hasData) {
          return CachedNetworkImage(
            imageUrl: s.data!,
            fit: fit,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              color: Colors.red,
            ),
          );
        } else {
          return Center(
            child: Icon(
              Icons.error,
              size: 40,
            ),
          );
        }
      },
    );
  }
}
