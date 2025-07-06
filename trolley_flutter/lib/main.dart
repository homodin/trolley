import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trolley_flutter/core/theme/theme.dart';
import 'package:trolley_flutter/core/theme/util.dart';
import 'package:trolley_flutter/features/ui/home.dart';
import 'package:trolley_flutter/repositories/movements_repo.dart';
import 'package:trolley_flutter/repositories/operators_repo.dart';
import 'package:trolley_flutter/repositories/parts_repo.dart';
import 'package:trolley_flutter/repositories/stillage_repo.dart';
import 'package:trolley_flutter/repositories/warehouse_repo.dart';
import 'package:trolley_flutter/services/api_client.dart';

void main(List<String> args) {
  runApp(Trolley());
}

class Trolley extends StatelessWidget {
  const Trolley({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Abel", "AR One Sans");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MultiProvider(
      providers: [
        // services
        Provider<ApiClient>(create: (_) => ApiClient()),
        // repositories
        ProxyProvider<ApiClient, WarehouseRepo>(
          update: (_, apiClient, __) => WarehouseRepo(apiClient),
        ),
        ProxyProvider<ApiClient, OperatorsRepo>(
          update: (_, apiClient, __) => OperatorsRepo(apiClient: apiClient),
        ),
        ProxyProvider<ApiClient, StillageRepo>(
          update: (_, apiClient, __) => StillageRepo(apiClient: apiClient),
        ),
        ProxyProvider<ApiClient, PartsRepo>(
          update: (_, apiClient, __) => PartsRepo(apiClient: apiClient),
        ),
        ProxyProvider<ApiClient, MovementsRepo>(
          update: (_, apiClient, __) => MovementsRepo(apiCLient: apiClient),
        ),
      ],
      child: MaterialApp(
        title: 'Trolley',
        home: Home(),
        debugShowCheckedModeBanner: false,
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      ),
    );
  }
}
