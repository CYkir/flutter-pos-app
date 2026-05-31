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

            GetMenuRestoLoaded() => ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: state.list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, index) {
                final menu = state.list[index];
                final imageUrl =
                    menu.imageMenu?.replaceAll('127.0.0.1', '10.0.2.2') ?? '';

                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    debugPrint('Tap menu: ${menu.name}');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: imageUrl.isEmpty
                              ? Container(
                                  width: 95,
                                  height: 95,
                                  color: Colors.grey.shade200,
                                  child: const Icon(Icons.image_not_supported),
                                )
                              : Image.network(
                                  imageUrl,
                                  width: 95,
                                  height: 95,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) {
                                    return Container(
                                      width: 95,
                                      height: 95,
                                      color: Colors.grey.shade200,
                                      child: const Icon(
                                        Icons.image_not_supported,
                                      ),
                                    );
                                  },
                                ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                menu.name ?? '-',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                menu.category ?? '-',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                menu.description ?? '-',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 12,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rp ${menu.price ?? '0'}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),

                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: menu.menuStatus == 'Ada'
                                          ? Colors.green.shade100
                                          : Colors.red.shade100,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      menu.menuStatus ?? '-',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: menu.menuStatus == 'Ada'
                                            ? Colors.green.shade700
                                            : Colors.red.shade700,
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
                  ),
                );
              },
            ),

            GetMenuRestoError() => Center(child: Text(state.message)),

            GetMenuRestoLoaded() => Center(child: Text("Data menu kosong")),
          };
        },
      ),
    );
  }
}
