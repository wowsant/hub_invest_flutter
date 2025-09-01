import 'package:get/get.dart';
import '../data/models/stock.model.dart';
import '../data/repositories/stock.repository.dart';

class HomeController extends GetxController {
  final StockRepository repo;
  HomeController(this.repo);

  final tabs = const ['Posições', 'Interesses', 'Todos'];
  final RxInt tabIndex = 0.obs;
  final RxString search = ''.obs;

  final RxBool loading = false.obs;
  final RxList<StockModel> items = <StockModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    load();
    debounce(search, (_) => load(), time: const Duration(milliseconds: 350));
  }

  Future<void> load() async {
    loading.value = true;
    try {
      final filter = switch (tabIndex.value) {
        0 => StockFilter.positions,
        1 => StockFilter.watchlist,
        _ => StockFilter.all,
      };
      final data = await repo.fetch(filter, query: search.value);
      items.assignAll(data);
    } finally {
      loading.value = false;
    }
  }

  void onTabChange(int i) {
    tabIndex.value = i;
    load();
  }

  void onSearch(String text) => search.value = text;
}
