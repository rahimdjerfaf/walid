import 'package:flutter/material.dart';

import '../../data/models/brand.dart';
import 'image_widget.dart';

class BrandWidget extends StatelessWidget {
  final Brand brand;
  final Function()? ontap;
  const BrandWidget({
    Key? key,
    required this.brand,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: ontap,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Stack(
            children: [
              Center(
                child: KImage(
                  url: brand.image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 5,
                left: 5,
                child: Text(
                  brand.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
