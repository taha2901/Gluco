import 'package:flutter/material.dart';
import 'package:gluco/core/widgets/constants.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CardOfSearch extends StatelessWidget {
  const CardOfSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Iconsax.search_normal_copy),
            Text(
              'بحث',
              style: TextStyle(fontSize: 22),
            ),
            Icon(Icons.filter_alt_outlined,color: kPrimaryColor,),
          ],
        ),
      ),
    );
  }
}
