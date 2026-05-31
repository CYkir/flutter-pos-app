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
    return Scaffold();
  }
}
