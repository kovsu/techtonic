import 'package:flutter/material.dart';
import 'package:tech_tonic/common/utils/typography.dart';

class HomeCustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;

  const HomeCustomCard(
      {super.key, required this.title, required this.subtitle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, 23),
            blurRadius: 30.0,
            spreadRadius: 5.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
        child: InkWell(
          onTap: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: CustomTypography.h3,
                    ),
                  ),
                  const Text(
                    '13 mins',
                    style: CustomTypography.outline,
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1681115085351-4c207e8e4ff9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                        width: 95,
                        height: 64,
                        fit: BoxFit
                            .cover, // 图片的缩放模式，cover 表示保持宽高比缩放，直到宽度或高度到达最大值，然后进行剪裁。
                      )),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text('Konv Suu'),
                            Text('  1小时前'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          subtitle,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
