import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/features/models/stillage_management_model.dart';
import 'package:trolley_flutter/repositories/operators_repo.dart';
import 'package:trolley_flutter/repositories/stillage_repo.dart';

class StillageManagement extends StatelessWidget {
  const StillageManagement({super.key, required this.op});
  final Operators op;

  @override
  Widget build(BuildContext context) {
    final viewModel = StillageManagementModel(op,
        stillageRepo: Provider.of<StillageRepo>(context),
        operatorsRepo: Provider.of<OperatorsRepo>(context));
    return Scaffold(
      appBar: AppBar(
        title: Text('Stillage Managenent'),
        actions: [
          TextButton(
              onPressed: () {
                viewModel.listStillages.execute();
              },
              child: Row(
                children: [Icon(Icons.refresh), Text('Refresh Stillage List')],
              )),
          Icon(Icons.supervisor_account),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(op.name),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListenableBuilder(
                listenable: viewModel.listStillages,
                builder: (context, status) {
                  if (viewModel.listStillages.isExecuting.value) {
                    return Center(
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator()));
                  }
                  if (viewModel.listStillages.errors.value != null) {
                    return Text(
                      'An error ocurred getting stillage list',
                      style: TextStyle(fontSize: 30),
                    );
                  }
                  if (viewModel.listStillages.results.value.hasData &&
                      viewModel.listStillages.results.value.data!.isNotEmpty) {
                    return Container(
                        child: Column(
                      children: viewModel.listStillages.results.value.data!
                          .map((stillage) {
                        return Card(
                          child: ListTile(
                            title: Text(
                                'Stillage number: ' + stillage!.stillageNumber),
                          ),
                        );
                      }).toList(),
                    ));
                  }
                  return Text(
                    'No Stillages, try refreshing the list',
                    style: TextStyle(fontSize: 30),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          StillageMaster? stillage;
          //create stillage dialog
          await showDialog(
              context: context,
              builder: (context) {
                String stillageNumber = '';
                return AlertDialog(
                  title: Text('Create Stillage'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            stillageNumber = value;
                          },
                          autofocus: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Stillage Number')),
                        ),
                      ),
                      Divider()
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          if (stillageNumber.length > 4) {
                            stillage =
                                StillageMaster(stillageNumber: stillageNumber);
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text('Create Stillage')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'))
                  ],
                );
              });
          //creation status indicator
          if (stillage == null) {
            await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'Error Creating stillage',
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                });
          } else if (stillage != null) {
            viewModel.createStillage.execute(stillage);
            await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Stillage Creation Status'),
                    content: ListenableBuilder(
                        listenable: viewModel.createStillage,
                        builder: (context, status) {
                          if (viewModel.createStillage.isExecuting.value) {
                            return Center(
                                child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator()));
                          }
                          if (viewModel.createStillage.errors.value != null) {
                            return Text(
                              'Error Creating stillage',
                              style: TextStyle(fontSize: 30),
                            );
                          }
                          return Text(
                            'Stillage Creation Successful',
                            style: TextStyle(fontSize: 30),
                          );
                        }),
                  );
                });
            viewModel.listStillages.execute();
          }
        },
        label: Row(
          children: [Icon(Icons.add), Text('Add Stillage')],
        ),
      ),
    );
  }
}
