import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/features/models/part_management_model.dart';
import 'package:trolley_flutter/repositories/operators_repo.dart';
import 'package:trolley_flutter/repositories/parts_repo.dart';

class PartManagement extends StatelessWidget {
  const PartManagement({super.key, required this.op});

  final Operators op;
  @override
  Widget build(BuildContext context) {
    final viewModel = PartManagementModel(op,
        operatorsRepo: Provider.of<OperatorsRepo>(context),
        partsRepo: Provider.of<PartsRepo>(context));
    return Scaffold(
      appBar: AppBar(
        title: Text('Part Number Manager'),
        actions: [
          TextButton(
            onPressed: () {
              viewModel.getPartList.execute();
              print(viewModel);
            },
            child: Row(
              children: [
                Icon(Icons.refresh_sharp),
                Text('Refresh Part List'),
              ],
            ),
          ),
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
                listenable: viewModel.getPartList,
                builder: (context, status) {
                  if (viewModel.getPartList.isExecuting.value) {
                    return Center(
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator()));
                  }
                  if (viewModel.getPartList.errors.value != null) {
                    return Text(
                      'An Error Occurred while getting part list',
                      style: TextStyle(fontSize: 30),
                    );
                  }
                  if (viewModel.getPartList.results.value.hasData &&
                      viewModel.getPartList.results.value.data!.length == 0) {
                    return Center(
                      child: Text(
                        'No parts found in the system, try refreshing the list.',
                        style: TextStyle(fontSize: 30),
                      ),
                    );
                  }
                  return Container(
                    child: Column(
                      children:
                          viewModel.getPartList.results.value.data!.map((part) {
                        return Card(
                          child: ListTile(
                            title: Text('Part Number: ' + part!.partNumber),
                            subtitle:
                                Text('Part Description: ' + part!.description),
                            trailing: IconButton(
                                onPressed: () {
                                  viewModel.deletePart.execute(part);
                                  viewModel.getPartList.execute();
                                },
                                icon: Icon(Icons.delete_outlined)),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            PartNumber? part;
            String partNumber = '';
            String description = '';
            String commonDescription = '';

            await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Enter Part Details'),
                    content: Column(
                      children: [
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (value) {
                              partNumber = value;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Part Number')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (value) {
                              description = value;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Description')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (value) {
                              commonDescription = value;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Common Description')),
                          ),
                        ),
                        Divider()
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (partNumber.length >= 4 &&
                              description.length > 4 &&
                              commonDescription.length > 4) {
                            part = PartNumber(
                                partNumber: partNumber,
                                description: description,
                                commonDescription: commonDescription,
                                pathToPic: '');
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text('Create Part'),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'))
                    ],
                  );
                });

            await showDialog(
                context: context,
                builder: (context) {
                  if (part == null) {
                    return AlertDialog(
                      title: Text('Error creating part'),
                    );
                  }
                  viewModel.createPart.execute(part); //create part
                  return AlertDialog(
                    title: Text('Part creationd status'),
                    content: ListenableBuilder(
                        listenable: viewModel.createPart,
                        builder: (context, status) {
                          if (viewModel.createPart.isExecuting.value) {
                            return Center(
                                child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator()));
                          }
                          if (viewModel.createPart.errors.value != null) {
                            return Text(
                              'An error occurred while trying to create part',
                              style: TextStyle(fontSize: 30),
                            );
                          }
                          return Text(
                            'Part successfully created',
                            style: TextStyle(fontSize: 30),
                          );
                        }),
                  );
                });
            viewModel.getPartList.execute();
          },
          label: Row(
            children: [Icon(Icons.add), Text('Add new part')],
          )),
    );
  }
}
