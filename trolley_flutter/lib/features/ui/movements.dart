import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/features/models/movements_model.dart';
import 'package:trolley_flutter/repositories/movements_repo.dart';
import 'package:trolley_flutter/repositories/operators_repo.dart';
import 'package:trolley_flutter/repositories/warehouse_repo.dart';

class Movements extends StatelessWidget {
  Movements({super.key});
  String localStillage = '';
  @override
  Widget build(BuildContext context) {
    final viewModel = MovementsModel(
        movementsRepo: Provider.of<MovementsRepo>(context),
        warehouseRepo: Provider.of<WarehouseRepo>(context),
        operatorRepo: Provider.of<OperatorsRepo>(context));
    viewModel.loadWarehouses.execute();
    bool scanned = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Movements'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  localStillage = value;
                },
                onSubmitted: (value) async {
                  scanned = false;
                  viewModel.getCurrentStillagePosition.execute(value);
                  TransferLog? transfer;
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: ListenableBuilder(
                              listenable: viewModel.getCurrentStillagePosition,
                              builder: (context, status) {
                                if (!viewModel.getCurrentStillagePosition
                                    .isExecuting.value) {
                                  transfer = viewModel.currentTransfer;
                                  print(transfer);
                                  if (transfer != null) {
                                    return Text(
                                      'Stillage: ${transfer!.stillageNumber} Found at: ${transfer!.targetWarehouse}',
                                      style: TextStyle(fontSize: 30),
                                    );
                                  } else {
                                    return Text(
                                      'Stillage not found',
                                      style: TextStyle(fontSize: 30),
                                    );
                                  }
                                }

                                return Center(
                                    child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator()));
                              }),
                        );
                      });
                  transfer = null;
                },
                autofocus: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('Scan Stillage')),
              ),
            ),
            ListenableBuilder(
                listenable: viewModel.getCurrentStillagePosition,
                builder: (context, status) {
                  if (viewModel.getCurrentStillagePosition.isExecuting.value) {
                    return Center(
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator()));
                  }
                  if (!viewModel.getCurrentStillagePosition.isExecuting.value &&
                      viewModel
                          .getCurrentStillagePosition.results.value.hasData &&
                      viewModel.getCurrentStillagePosition.results.value.data !=
                          null) {
                    String operatorCode = ''; //This should not be here
                    return Container(
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...viewModel
                                .getCurrentStillagePosition.results.value.data!
                                .toJson()
                                .entries
                                .map((entry) =>
                                    Text('${entry.key} : ${entry.value}'))
                                .toList(),
                            MaterialButton(
                              color: Colors.blue,
                              onPressed: () async {
                                Operators? op;
                                if (viewModel.currentTransfer == null) {
                                  await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text(
                                                'Error clear scan area and scan code again'),
                                          ));
                                  return;
                                }
                                if (viewModel.currentTransfer!
                                            .stillageIsInGeneralGoodCondition ==
                                        'no' ||
                                    viewModel
                                            .currentTransfer!.hookInGoodCondition ==
                                        'no' ||
                                    viewModel
                                            .currentTransfer!.remainingCycles <=
                                        0 ||
                                    viewModel.currentTransfer!
                                            .floorMeshInGoodCondition ==
                                        'no') {
                                  //Autorisation Flow
                                  await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text(
                                                'Autorization Required to Complete This Transaction'),
                                            content: ListenableBuilder(
                                              builder: (context, status) {
                                                if (viewModel.getOperators
                                                    .isExecuting.value) {
                                                  return Center(
                                                      child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator()));
                                                }
                                                if (viewModel.getOperators
                                                        .errors.value !=
                                                    null) {
                                                  op = Operators(
                                                      name: 'reject',
                                                      opType:
                                                          OperatorType.Engineer,
                                                      clockNumber: 'reject',
                                                      password: 'reject');
                                                  Future.delayed(
                                                      Duration(seconds: 2), () {
                                                    Navigator.of(context).pop();
                                                  });
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons.warning,
                                                        color: Colors.yellow,
                                                        size: 50,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                            'Authentication Failed'),
                                                      )
                                                    ],
                                                  );
                                                }
                                                if (viewModel
                                                        .getOperators
                                                        .results
                                                        .value
                                                        .hasData &&
                                                    viewModel
                                                            .getOperators
                                                            .results
                                                            .value!
                                                            .data ==
                                                        null) {
                                                  op = Operators(
                                                      name: 'reject',
                                                      opType:
                                                          OperatorType.Engineer,
                                                      clockNumber: 'reject',
                                                      password: 'reject');
                                                  Future.delayed(
                                                      Duration(seconds: 2), () {
                                                    Navigator.of(context).pop();
                                                  });
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons.warning,
                                                        color: Colors.yellow,
                                                        size: 50,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                            'User not Found'),
                                                      )
                                                    ],
                                                  );
                                                }
                                                if (viewModel
                                                        .getOperators
                                                        .results
                                                        .value
                                                        .hasData &&
                                                    viewModel
                                                            .getOperators
                                                            .results
                                                            .value!
                                                            .data !=
                                                        null) {
                                                  op = viewModel.getOperators
                                                      .results.value!.data;
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons.warning,
                                                        color: Colors.yellow,
                                                        size: 50,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                            'Authentication Successful'),
                                                      )
                                                    ],
                                                  );
                                                }

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Divider(),
                                                    TextField(
                                                      onChanged: (value) {
                                                        operatorCode = value;
                                                      },
                                                      decoration: InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          label: Text(
                                                              'Authorization Code')),
                                                    ),
                                                    Divider(),
                                                  ],
                                                );
                                              },
                                              listenable:
                                                  viewModel.getOperators,
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () async {
                                                    viewModel.getOperators
                                                        .execute(operatorCode);
                                                  },
                                                  child: Text(
                                                      'Authorize Transaction')),
                                              TextButton(
                                                  onPressed: () {
                                                    op = Operators(
                                                        name: 'reject',
                                                        opType: OperatorType
                                                            .Engineer,
                                                        clockNumber: 'reject',
                                                        password: 'reject');
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Cancel'))
                                            ],
                                          ));
                                }
                                if (op != null && op!.name == 'reject') {
                                  viewModel.currentTransfer = null;
                                }
                                if (op != null && !(op!.name != 'reject')) {
                                  viewModel.currentTransfer = viewModel
                                      .getCurrentStillagePosition
                                      .results
                                      .value!
                                      .data!
                                      .copyWith(
                                          overrided: 'yes',
                                          overrideAuth: op!.name,
                                          overrideCode: op!.name);
                                  viewModel.currentTransfer =
                                      viewModel.currentTransfer!.copyWith(
                                          sourceWarehouse: viewModel
                                              .currentTransfer!.targetWarehouse,
                                          targetWarehouse: viewModel
                                              .getNextWarehouse(viewModel
                                                  .getCurrentStillagePosition
                                                  .results
                                                  .value
                                                  .data!
                                                  .targetWarehouse));
                                }
                                if (op != null && (op!.name != 'reject')) {
                                  viewModel.currentTransfer = viewModel
                                      .getCurrentStillagePosition
                                      .results
                                      .value!
                                      .data!
                                      .copyWith(
                                          sourceWarehouse: viewModel
                                              .getCurrentStillagePosition
                                              .results
                                              .value!
                                              .data!
                                              .targetWarehouse,
                                          targetWarehouse: viewModel
                                              .getNextWarehouse(viewModel
                                                  .getCurrentStillagePosition
                                                  .results
                                                  .value
                                                  .data!
                                                  .targetWarehouse));
                                }
                                await showDialog(
                                    context: context,
                                    builder: (context) {
                                      viewModel.acceptStillage.execute(
                                          viewModel.currentTransfer!.copyWith(
                                              sourceWarehouse: viewModel
                                                  .currentTransfer!
                                                  .targetWarehouse,
                                              targetWarehouse: viewModel
                                                  .getNextWarehouse(viewModel
                                                      .getCurrentStillagePosition
                                                      .results
                                                      .value
                                                      .data!
                                                      .targetWarehouse)));
                                      print('Accept Passed');
                                      return ListenableBuilder(
                                          listenable: viewModel.acceptStillage,
                                          builder: (context, status) {
                                            print('processing');
                                            if (viewModel.acceptStillage.errors
                                                    .value !=
                                                null) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.warning,
                                                    color: Colors.yellow,
                                                    size: 50,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child:
                                                        Text('Error Occurred'),
                                                  )
                                                ],
                                              );
                                            }
                                            if (viewModel.acceptStillage
                                                .isExecuting.value) {
                                              return Center(
                                                  child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator()));
                                            }
                                            viewModel.currentTransfer = null;
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.check,
                                                  color: Colors.green,
                                                  size: 50,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      'Transaction Successful'),
                                                )
                                              ],
                                            );
                                          });
                                    });
                              },
                              child: viewModel.currentTransfer == null
                                  ? Text('Clear text area and scan again')
                                  : Text(viewModel.getNextWarehouse(viewModel
                                              .getCurrentStillagePosition
                                              .results
                                              .value
                                              .data!
                                              .targetWarehouse) ==
                                          null
                                      ? 'No default destination found'
                                      : 'Accept Stillage Into: ${viewModel.getNextWarehouse(viewModel.getCurrentStillagePosition.results.value.data!.targetWarehouse)}'),
                            )
                          ],
                        ),
                      )),
                    );
                  }
                  return Container();
                })
          ],
        ),
      ),
    );
  }
}
