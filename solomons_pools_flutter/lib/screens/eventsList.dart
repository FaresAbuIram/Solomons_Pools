import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:solomons_pools_flutter/models/provider.dart';
import 'package:solomons_pools_flutter/widgets/eventItem.dart';

class EvenstList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EventData>(
      builder: (context, value, child) {
        if (value.geteventsNumber() == 0)
          return Center(child: CircularProgressIndicator());
        else
          return Container(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Swiper(
                viewportFraction: 0.8,
                itemCount: value.geteventsNumber(),
                scale: 0.9,
                loop: false,
                itemBuilder: (BuildContext context, int index) {
                  return EventItem(
                    event: value.allEvents[index],
                  );
                },
              ),
            ),
          );
      },
    );
  }
}
