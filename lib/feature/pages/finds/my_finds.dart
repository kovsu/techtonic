import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class MyFindsPage extends StatefulWidget {
  const MyFindsPage({super.key});

  @override
  State<MyFindsPage> createState() => _MyFindsPageState();
}

class _MyFindsPageState extends State<MyFindsPage> {
  List<Container> cards = [
    Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: const Text('1'),
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: const Text('2'),
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: const Text('3'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return CardSwiper(
      cardsCount: cards.length,
      cardBuilder: (context, index) => cards[index],
      isLoop: false,
      onEnd: () => print('end'),
    );
  }
}
