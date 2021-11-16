import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/core_packages.dart';
import '../../domain/entities/character.dart';

class CharacterDetail extends StatelessWidget {
  const CharacterDetail({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    String _name;
    if (character.name?.isEmpty ?? true) {
      _name = 'No name';
    } else {
      _name = character.name!;
    }
    String _description;
    if (character.description?.isEmpty ?? true) {
      _description = 'No description';
    } else {
      _description = character.description!;
    }
    return Scaffold(
      backgroundColor: KColors.scaffoldColor,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: KColors.mainColor,
        ),
        preferredSize: const Size.fromHeight(0),
      ),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          // pinned: true,
          backgroundColor: KColors.scaffoldColor,
          expandedHeight: MediaQuery.of(context).size.height * 0.40,
          iconTheme: const IconThemeData(
            color: KColors.title,
          ),
          flexibleSpace: FlexibleSpaceBar.createSettings(
            currentExtent: 0.0,
            child: FlexibleSpaceBar(
              background: Hero(
                tag: character.id.toString(),
                child: Container(
                  decoration: BoxDecoration(
                    color: KColors.scaffoldColor,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(character.getAddress()),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
            minHeight: 50.0,
            maxHeight: 50.0,
            child: Container(
              color: KColors.scaffoldColor,
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: Text(
                _name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 28,
                  color: KColors.title,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            child: Text(
              _description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 18,
                color: KColors.text,
              ),
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
            minHeight: 40.0,
            maxHeight: 40.0,
            child: Container(
              decoration: const BoxDecoration(
                color: KColors.mainColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2.0),
                  topRight: Radius.circular(2.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Text(
                  'List of comics:',
                  style: TextStyle(
                    fontSize: 20,
                    color: KColors.lightColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    '\u2022 ${character.comics!.items![index].name!}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                );
              },
              childCount: character.comics!.items!.length,
            ),
          ),
        ),
      ]),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
