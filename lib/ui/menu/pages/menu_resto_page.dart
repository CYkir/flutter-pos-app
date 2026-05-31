import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_app/ui/menu/bloc/get_menu_restoes/get_menu_restoes_bloc.dart';

class MenuResto extends StatelessWidget {
  const MenuResto({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMenuRestoesBloc(),
      child: MenuRestoPage(),
    );
  }
}

class MenuRestoPage extends StatefulWidget {
  const MenuRestoPage({super.key});

  @override
  State<MenuRestoPage> createState() => _MenuRestoPageState();
}

class _MenuRestoPageState extends State<MenuRestoPage> {
  late GetMenuRestoesBloc getMenuRestoesBloc;

  @override
  void initState() {
    super.initState();
    getMenuRestoesBloc = context.read<GetMenuRestoesBloc>()
      ..add(MenuRestoFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Menu Resto"),
      ),
      body: BlocBuilder<GetMenuRestoesBloc, GetMenuRestoesState>(
        builder: (context, state) {
          return switch (state) {
            GetMenuRestoesInitial() || GetMenuRestoLoading() => const Center(
              child: CircularProgressIndicator(),
            ),

            GetMenuRestoLoaded() => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: state.list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (_, index) {
                  final menu = state.list[index];
                  final imageUrl =
                      menu.imageMenu?.replaceAll('127.0.0.1', '10.0.2.2') ?? '';

                  debugPrint('IMAGE URL: $imageUrl');
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade300),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// IMAGE
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            child: Image.network(
                              imageUrl,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) {
                                return const Center(
                                  child: Icon(Icons.image_not_supported),
                                );
                              },
                            ),
                          ),
                        ),

                        /// CONTENT
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// NAME
                              Text(
                                '${state.list[index].name}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),

                              const SizedBox(height: 4),

                              /// CATEGORY
                              Text(
                              '${state.list[index].name}',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),

                              const SizedBox(height: 8),

                              /// PRICE + STATUS
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rp ${menu.price}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: menu.menuStatus == 'Ada'
                                          ? Colors.green.shade100
                                          : Colors.red.shade100,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      '${state.list[index].name}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: menu.menuStatus == 'Ada'
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            GetMenuRestoError() => Center(child: Text(state.message)),

            _ => const Center(child: Text("Data menu kosong")),
          };
        },
      ),
    );
  }
}
