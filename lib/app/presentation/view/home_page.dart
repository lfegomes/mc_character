import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core_packages.dart';
import '../../domain/entities/character.dart';
import '../components/error_screen.dart';
import '../components/loading_indicator.dart';
import '../components/tiny_error.dart';
import '../components/tiny_loading.dart';
import '../viewmodel/character_viewmodel.dart';
import 'character_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _vm = GetIt.I<CharacterViewModel>();
  final _pagingController = PagingController<int, Character>(
    firstPageKey: 1,
  );

  List<ReactionDisposer>? _disposers;

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((page) {
      Future.delayed(Duration.zero).then((_) {
        _vm.fetchCharacters(page);
      });
    });
  }

  @override
  void didChangeDependencies() {
    _disposers ??= [
      reaction(
        (_) => _vm.somethingWentWrong,
        (_) => _pagingController.error = 'error',
      ),
      reaction(
        (_) => _vm.appendCharacters,
        (_) {
          if (_vm.nextPage == 0) {
            _pagingController.appendLastPage(_vm.newPageItems);
          } else {
            _pagingController.appendPage(
              _vm.newPageItems,
              _vm.nextPage,
            );
          }
        },
      ),
    ];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _disposers!.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: KColors.mainColor,
        title: const Text('Marvel Characters'),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        color: KColors.mainColor,
        child: PagedListView(
          padding: const EdgeInsets.only(top: 8.0),
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Character>(
            firstPageProgressIndicatorBuilder: (context) =>
                const LoadingIndicator(),
            firstPageErrorIndicatorBuilder: (context) => ErrorScreen(
              () => _pagingController.refresh(),
            ),
            newPageProgressIndicatorBuilder: (context) => const TinyLoading(),
            newPageErrorIndicatorBuilder: (context) => TinyError(
              onTap: () => _pagingController.retryLastFailedRequest(),
            ),
            noItemsFoundIndicatorBuilder: (context) => const Center(
              child: Text('No item found'),
            ),
            itemBuilder: (context, item, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                child: _CharacterCard(character: item),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CharacterCard extends StatelessWidget {
  const _CharacterCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _radius = 16.0;
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
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CharacterDetail(character: character),
        ),
      ),
      child: Card(
        margin: const EdgeInsets.only(bottom: 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radius),
        ),
        child: SizedBox(
          height: _height * 0.15,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: 4,
                    child: Hero(
                      tag: character.id.toString(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(_radius),
                            bottomLeft: Radius.circular(_radius),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(character.getAddress()),
                          ),
                        ),
                      ),
                    )),
                Flexible(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: KColors.title,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              _description,
                              maxLines: constraints.maxHeight > 120 ? 4 : 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: KColors.softText,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
