import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/core/widgets/custom_dialogs.dart';
import 'package:trolley_flutter/features/models/home_model.dart';
import 'package:trolley_flutter/features/ui/movements.dart';
import 'package:trolley_flutter/features/ui/operator_management.dart';
import 'package:trolley_flutter/features/ui/part_management.dart';
import 'package:trolley_flutter/features/ui/stillage_management.dart';
import 'package:trolley_flutter/features/ui/warehouse.dart';
import 'package:trolley_flutter/services/api_client.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final CustomDialogs dialogs = CustomDialogs();

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeModel(api: Provider.of<ApiClient>(context).api);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              SystemNavigator.pop(animated: true);
            },
            icon: Icon(Icons.cancel_outlined)),
        title: Text('Trolley'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(viewModel.getHost()),
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Card.outlined(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Options:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () async {
                      final Operators? op = await showDialog(
                          context: context,
                          builder: (context) =>
                              dialogs.authoriseUser(context, viewModel));

                      await showDialog(
                          context: context,
                          builder: (context) =>
                              dialogs.authorizationResult(context, op));
                      //Navigate: to operator screen
                      if (op != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OperatorManagement(
                                  op: op,
                                )));
                      }
                    },
                    child: Row(
                      children: [
                        Icon(Icons.manage_accounts),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Operator Manager')
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () async {
                      final Operators? op = await showDialog(
                          context: context,
                          builder: (context) =>
                              dialogs.authoriseUser(context, viewModel));

                      await showDialog(
                          context: context,
                          builder: (context) =>
                              dialogs.authorizationResult(context, op));
                      //Navigate: to operator screen
                      if (op != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WarehouseManagement(
                                  op: op,
                                )));
                      }
                    },
                    child: Row(
                      children: [
                        Icon(Icons.house),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Warehouse Manager')
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () async {
                      final Operators? op = await showDialog(
                          context: context,
                          builder: (context) =>
                              dialogs.authoriseUser(context, viewModel));

                      await showDialog(
                          context: context,
                          builder: (context) =>
                              dialogs.authorizationResult(context, op));
                      //Navigate: to operator screen
                      if (op != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PartManagement(
                                  op: op,
                                )));
                      }
                    },
                    child: Row(
                      children: [
                        Icon(Icons.anchor_rounded),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Part Manager')
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () async {
                      final Operators? op = await showDialog(
                          context: context,
                          builder: (context) =>
                              dialogs.authoriseUser(context, viewModel));

                      await showDialog(
                          context: context,
                          builder: (context) =>
                              dialogs.authorizationResult(context, op));
                      //Navigate: to operator screen
                      if (op != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StillageManagement(
                                  op: op,
                                )));
                      }
                    },
                    child: Row(
                      children: [
                        Icon(Icons.trolley),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Stillage Manager')
                      ],
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Movements()));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.run_circle_rounded),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Run')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
