import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tech_tonic/common/utils/api.dart';
import 'package:tech_tonic/common/utils/typography.dart';

class HomeNewsPage extends StatefulWidget {
  const HomeNewsPage({super.key});

  @override
  State<HomeNewsPage> createState() => _HomeNewsPageState();
}

class _HomeNewsPageState extends State<HomeNewsPage> {
  List dataList = [];

  Future<void> fetchData() async {
    final resp = await Api.webScraper();
    final jsonResponse = jsonDecode(resp.body);

    setState(() {
      dataList = jsonResponse['data'] as List;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    print(dataList);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          '精彩资讯',
          style: CustomTypography.h2,
        ),
        const SizedBox(height: 8),
        CarouselSlider(
          options: CarouselOptions(height: 150.0),
          items: dataList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        image: DecorationImage(
                          image: NetworkImage(i['image']),
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
                            children: [
                              Text(
                                i['title'],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                maxLines: 1,
                              ),
                              Text(
                                i['time'],
                                style: const TextStyle(
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
