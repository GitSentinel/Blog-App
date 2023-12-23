import 'package:create_app/config/app_config.dart';
import 'package:create_app/data/model/post.dart';
import 'package:create_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/temp/user1.jpg',
                width: 40,
                height: 40,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                '${post.owner?.firstname} ${post.owner?.lastname}',
                style: AppText.subtitle3,
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Image.network('${AppConfig.baseUrl}${post.image}'),
          SizedBox(
            height: 12,
          ),
          Text(
            post.message ?? '',
            style: AppText.subtitle3,
          )
        ],
      ),
    );
  }
}
