import 'package:cari_tukang/models/models.dart';
import 'package:cari_tukang/shared/shared.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Available available;
  CategoryCard(this.available);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        width: 60,
        child: Column(
          children: [
            Container(
              child: Image.asset(
                available.imageUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                //color: Colors.black.withOpacity(0.5),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Center(
              child: Text(
                available.name,
                textAlign: TextAlign.center,
                style: blackTextFont.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
