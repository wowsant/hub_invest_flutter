import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../menu/main.controller.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final bool showAppBar; // para eventual reutilização
  const MainScaffold({super.key, required this.body, this.showAppBar = true});

  @override
  Widget build(BuildContext context) {
    final menu = Get.find<MainController>(); // itens dinâmicos
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              elevation: 2,
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              title: SizedBox(
                height: 40,
                child: Image.asset('assets/images/logo.png'),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () => Get.toNamed(Routes.settings),
                ),
              ],
            )
          : null,
      drawer: Drawer(
        child: SafeArea(
          child: Obx(() {
            final items = menu.items;
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              separatorBuilder: (_, _) => const Divider(height: 1),
              itemCount: items.length,
              itemBuilder: (_, i) {
                final it = items[i];
                return ListTile(
                  leading: Icon(it.icon),
                  title: Text(it.label),
                  onTap: () {
                    Navigator.of(context).pop(); // fecha o drawer
                    if (it.route != null) {
                      Get.offAllNamed(it.route!);
                    } else if (it.onTap != null) {
                      it.onTap!();
                    }
                  },
                );
              },
            );
          }),
        ),
      ),
      body: body,
      backgroundColor: const Color(0xFFF4F5F7),
    );
  }
}
