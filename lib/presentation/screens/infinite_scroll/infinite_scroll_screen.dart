import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted =
      true; // para la verificación que se haya desmonatado el componente en general

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) {
      return; // valida si el usuarion está muy arriba para no tener que bajarlo forzosamente
    }
    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    if (!isMounted) {
      return; // para la verificación que se haya desmonatado el componente en general
    }
    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;
    isLoading = false;
    final lasId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lasId + 1);
    addFiveImages();

    setState(() {});
  }

  @override
  void initState() {
    scrollController.addListener(() {
      // scrollController.position.pixels <-------------- posicion actual
      // scrollController.position.maxScrollExtent <----- más que puede llegar (posición máxima)
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // Load next page
        loadNextPage();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted =
        false; // para la verificación que se haya desmonatado el componente en general
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('infinite Scroll')),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              edgeOffset: 10,
              strokeWidth: 2,
              onRefresh: onRefresh,
              child: ListView.builder(
                // builder construye en ejecución
                controller: scrollController,
                itemCount: imagesIds.length,
                itemBuilder: (context, index) {
                  return FadeInImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                    placeholder: const AssetImage(
                      'assets/images/jar-loading.gif',
                    ),
                    image: NetworkImage(
                      'https://picsum.photos/id/${imagesIds[index]}/500/300',
                    ),
                  );
                },
              ),
            ),
            isLoading
                ? Positioned(
                    bottom: 30,
                    left: 30,
                    child: FadeInUp(
                      duration: const Duration(seconds: 1),
                      from: 50,
                      child: FilledButton(
                        onPressed: () {},
                        child: SpinPerfect(
                          infinite: isLoading,
                          child: const Icon(Icons.refresh_rounded),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
