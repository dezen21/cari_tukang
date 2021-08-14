import 'package:cari_tukang/models/models.dart';
import 'package:cari_tukang/shared/shared.dart';
import 'package:flutter/material.dart';

class TukangCard extends StatelessWidget {
  final Tukang tukang;

  TukangCard(this.tukang);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 30,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              child: Image.asset(
                tukang.imageUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                //color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Center(
            child: Text(
              tukang.name,
              textAlign: TextAlign.center,
              style: blackTextFont.copyWith(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
