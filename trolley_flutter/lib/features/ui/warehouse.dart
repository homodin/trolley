import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/features/models/warehouse_model.dart';
import 'package:trolley_flutter/repositories/warehouse_repo.dart';

class WarehouseManagement extends StatelessWidget {
  WarehouseManagement({super.key, required this.op});
  final Operators op;

  @override
  Widget build(BuildContext context) {
    final viewModel =
        WarehouseModel(warehouseRepo: Provider.of<WarehouseRepo>(context));
    return Scaffold(
      appBar: AppBar(
        title: Text('Warehouse Manager'),
        actions: [
          TextButton(
            onPressed: () {
              viewModel.getWarehouses.execute();
              print(viewModel.listWareHouses);
            },
            child: Row(
              children: [
                Icon(Icons.refresh_sharp),
                Text('Refresh Warehouse List'),
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
                listenable: viewModel.getWarehouses,
                builder: (context, warehouseRefreshState) {
                  if (viewModel.getWarehouses.isExecuting.value) {
                    return Center(
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator()));
                  }
                  if (!viewModel.getWarehouses.isExecuting.value &&
                      viewModel.listWareHouses.length == 0) {
                    return Center(
                        child:
                            Text('No wareshouses. Try refreshing warehouses'));
                  }
                  if (viewModel.getWarehouses.errors.value != null) {
                    return Center(child: Text('Error getting warehouse list'));
                  }
                  return Container(
                    child: Column(
                      children: viewModel.getWarehouses.results.value.data!
                          .map((wareHouse) => Card(
                                child: ListTile(
                                  trailing: IconButton(
                                      onPressed: () async {
                                        viewModel.deleteWarehouse
                                            .execute(wareHouse);
                                        //Show Dialog to indicate result of delete
                                        await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text('Delete Result'),
                                                content: ListenableBuilder(
                                                    listenable: viewModel
                                                        .deleteWarehouse,
                                                    builder: (context, result) {
                                                      if (viewModel
                                                          .deleteWarehouse
                                                          .isExecuting
                                                          .value) {
                                                        return Center(
                                                            child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator()));
                                                      }
                                                      if (viewModel
                                                              .deleteWarehouse
                                                              .errors
                                                              .value !=
                                                          null) {
                                                        return Text(
                                                          'An error occured while deleting warehouse',
                                                          style: TextStyle(
                                                              fontSize: 30),
                                                        );
                                                      }
                                                      return Text(
                                                          'Warehouse Deleted');
                                                    }),
                                              );
                                            });
                                        viewModel.getWarehouses.execute();
                                      },
                                      icon: Icon(Icons.delete_outline)),
                                  title: Text(
                                    wareHouse!.warehouse,
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Warehouses? warehouse;

            await showDialog(
                //Dialog to create new Warehouse
                context: context,
                builder: (context) {
                  String warehouseName = '';
                  String defaultNext = '';
                  return AlertDialog(
                    title: Text('Enter New Warehouse Name:'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (value) {
                              warehouseName = value;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Warehouse')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (value) {
                              defaultNext = value;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Default Next Warehouse')),
                          ),
                        ),
                        Divider()
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            if (warehouseName.length >= 4 &&
                                defaultNext.length >= 4) {
                              warehouse = Warehouses(
                                  warehouse: warehouseName,
                                  defaultNext: defaultNext);
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text('Create Warehouse')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'))
                    ],
                  );
                });
            if (warehouse != null) {
              //Show Dialog to indicate result of creation
              viewModel.createWarehouse.execute(warehouse);
              await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Warehouse Creation Status:'),
                      content: ListenableBuilder(
                          listenable: viewModel.createWarehouse,
                          builder: (context, status) {
                            if (viewModel.createWarehouse.isExecuting.value) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (viewModel.createWarehouse.errors.value !=
                                null) {
                              return Text('Error Occured during creation');
                            } else {
                              return Text('Creation Successful');
                            }
                          }),
                    );
                  });
            }
            viewModel.getWarehouses.execute();
          },
          label: Row(
            children: [Icon(Icons.add), Text('Add Warehouse')],
          )),
    );
  }
}
