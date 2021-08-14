import 'package:cari_tukang/models/models.dart';
import 'package:cari_tukang/shared/shared.dart';
import 'package:flutter/material.dart';

class AvailableCard extends StatelessWidget {
  final Available available;
  AvailableCard(this.available);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 140,
        width: 210,
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  child: Image.asset(
                    available.imageUrl,
                    height: 140,
                    width: 210,
                    fit: BoxFit.cover,
                    //color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, bottom: 5),
                      child: Text(
                        available.name,
                        style: whiteTextFont.copyWith(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, bottom: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}

// class AvailableCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 140,
//       width: 210,
//       child: Column(
//         children: [
//           Image.asset(
//             'assets/available_interior.png',
//             height: 140,
//             width: 210,
//             fit: BoxFit.cover,
//           ),
//           SizedBox(
//             height: 12,
//           )
//         ],
//       ),
//     );
//   }
// }
