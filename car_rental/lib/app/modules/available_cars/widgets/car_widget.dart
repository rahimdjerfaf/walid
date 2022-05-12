import 'package:flutter/material.dart';

import '../../../data/constatns/app_themes.dart';
import '../../../data/models/brand.dart';
import '../../../data/models/car.dart';
import '../../widgets/image_widget.dart';

class CarWidget extends StatelessWidget {
  final Car car;
  final Brand brand;
  final int? index;
  const CarWidget({
    Key? key,
    required this.car,
    required this.brand,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: AppThemes.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    car.condition,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 120,
              child: Center(
                child: Hero(
                    tag: "${car.brandid}/${car.model}",
                    child: KImage(
                      url: car.images.first,
                    )),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              car.model,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              brand.name,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
            Text(
              "per " +
                  (car.condition == "Daily"
                      ? "day"
                      : car.condition == "Weekly"
                          ? "week"
                          : "month"),
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
