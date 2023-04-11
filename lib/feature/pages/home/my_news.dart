import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tech_tonic/common/utils/typography.dart';

class HomeNewsPage extends StatefulWidget {
  const HomeNewsPage({super.key});

  @override
  State<HomeNewsPage> createState() => _HomeNewsPageState();
}

class _HomeNewsPageState extends State<HomeNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          '每日资讯',
          style: CustomTypography.h2,
        ),
        const SizedBox(height: 8),
        CarouselSlider(
          options: CarouselOptions(height: 150.0),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1681115085351-4c207e8e4ff9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
                          fit: BoxFit.cover, // 填充方式
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Hello World!",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                maxLines: 1,
                              ),
                              Text(
                                "13 mins",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      ),
                    ));
              },
            );
          }).toList(),
        )
      ]),
    );
  }
}
