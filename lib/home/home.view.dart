import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home.controller.dart';
import 'widgets/filter.tabs.dart';
import 'widgets/search.field.dart';
import 'widgets/stock.card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            // Busca
            SearchField(onChanged: controller.onSearch),
            const SizedBox(height: 12),

            // Abas (Posições | Interesses | Todos)
            Obx(() => FilterTabs(
                  tabs: controller.tabs,
                  current: controller.tabIndex.value,
                  onChange: controller.onTabChange,
                )),
            const SizedBox(height: 12),

            // Lista de cards
            Expanded(
              child: Obx(() {
                if (controller.loading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                final items = controller.items;
                if (items.isEmpty) {
                  return const Center(child: Text('Nada encontrado'));
                }
                return GridView.builder(
                  padding: const EdgeInsets.only(bottom: 12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.6,
                  ),
                  itemCount: items.length,
                  itemBuilder: (_, i) => StockCard(item: items[i]),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
