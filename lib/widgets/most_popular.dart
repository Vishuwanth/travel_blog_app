import 'package:flutter/material.dart';
import 'package:travel_blog_app/detail.dart';
import 'package:travel_blog_app/model/travel.dart';

class MostPopular extends StatelessWidget {
  // const MostPopular({ Key? key }) : super(key: key);
  final _list = Travel.generateMostPopular();
  final _pageCtrl = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var travel = _list[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return DetailsPage(
                    travel: travel,
                  );
                },
              ),
            );
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  travel.url,
                  width: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      travel.location,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      travel.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (_, index) => SizedBox(
        width: 15,
      ),
      itemCount: _list.length,
    );
  }
}
