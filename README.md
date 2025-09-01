# hub_invest_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


flutter run | Select-String -NotMatch "EGL_emulation"



/*
4) Como replicar o padrão para outras telas

Crie o módulo (pasta) feature/feature.binding.dart, feature.controller.dart, feature.view.dart.

Na rota da tela interna, faça page: () => MainScaffold(body: FeatureView()).

Para telas sem AppBar (ex.: login/cadastro), registre a rota normalmente sem MainScaffold.

Se precisar de menu dinâmico diferente, ajuste MenuRepository (ele pode bater na sua API para retornar itens conforme o usuário/feature).

*/