import 'package:flutter/material.dart';
import 'package:travel_blog_app/model/travel.dart';

class DetailsPage extends StatelessWidget {
  // const DetailsPage({ Key? key }) : super(key: key);
  final Travel travel;
  final double expandedHeight = 300;
  final double roundedContainerHeight = 50;
  DetailsPage({required this.travel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          slivers: [
            _buildSliverHeader(),
            SliverToBoxAdapter(
              child: _buildDetails(context),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, right: 15, left: 15),
          child: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget _buildSliverHeader() {
    return SliverPersistentHeader(
        delegate: DetailSliverDelegate(
      travel: travel,
      expandedHeight: expandedHeight,
      roundedContainerHeight: roundedContainerHeight,
    ));
  }

  Widget _buildDetails(context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Column(
          children: [
            _buildUserInfo(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                travel.description,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                  height: 1,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "View All",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 1.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              // width: MediaQuery.of(context).size.width,
              height: 150,
              child: FeaturedWidget(),
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            travel.url,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                travel.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                travel.location,
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
        Spacer(),
        Icon(
          Icons.share,
          color: Colors.grey,
        )
      ],
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final Travel travel;
  final double expandedHeight;
  final double roundedContainerHeight;

  DetailSliverDelegate(
      {required this.travel,
      required this.expandedHeight,
      required this.roundedContainerHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset(
            travel.url,
            width: MediaQuery.of(context).size.width,
            height: expandedHeight,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset + 1,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0),
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight - shrinkOffset - 120,
          left: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                travel.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text(
                travel.location,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => expandedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}

// class FeaturedWidget extends StatelessWidget {
//   final _list = Travel.generateMostPopular();
//   @override
//   Widget build(Object context) {
//     return ListView.separated(
//         // shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           var travel = _list[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return DetailsPage(
//                       travel: travel,
//                     );
//                   },
//                 ),
//               );
//             },
//             child: Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: Image.asset(
//                     travel.url,
//                     width: 140,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   left: 15,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         travel.location,
//                         style: TextStyle(color: Colors.white, fontSize: 15),
//                       ),
//                       Text(
//                         travel.name,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           );

//           // Container(
//           //   height: 100,
//           //   width: 120,
//           //   child: Image.asset(
//           //     travel.url,
//           //     fit: BoxFit.cover,
//           //   ),
//           // );
//         },
//         separatorBuilder: (_, index) => SizedBox(
//               width: 10,
//             ),
//         itemCount: _list.length);
//   }
// }

class FeaturedWidget extends StatelessWidget {
  final _list = Travel.generateMostPopular();
  @override
  Widget build(Object context) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var travel = _list[index];
          return Container(
            width: 120,
            child: Image.asset(travel.url, fit: BoxFit.cover),
          );
        },
        separatorBuilder: (_, index) => SizedBox(width: 10),
        itemCount: _list.length);
  }
}
