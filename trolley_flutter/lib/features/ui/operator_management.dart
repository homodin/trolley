import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/features/models/operator_management_model.dart';
import 'package:trolley_flutter/repositories/operators_repo.dart';

class OperatorManagement extends StatelessWidget {
  OperatorManagement({super.key, required this.op});
  final Operators op;

  @override
  Widget build(BuildContext context) {
    final viewModel = OperatorManagementModel(
        operatorsRepo: Provider.of<OperatorsRepo>(context));
    return Scaffold(
      appBar: AppBar(
        title: Text('Operator Management'),
        actions: [
          MaterialButton(
            onPressed: () {
              viewModel.refreshOpList.execute();
              print(viewModel.staticList);
            },
            child: Row(
              children: [
                Icon(Icons.refresh_sharp),
                Text('Refresh Operator List')
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
                listenable: viewModel.refreshOpList,
                builder: (context, refreshState) {
                  if (!viewModel.refreshOpList.isExecuting.value &&
                      viewModel.staticList.length == 0) {
                    return Text("No Operators. Try refreshing the list");
                  }
                  if (viewModel.refreshOpList.isExecuting.value) {
                    return CircularProgressIndicator();
                  }
                  return Container(
                    child: Column(
                      children: viewModel.staticList
                          .map((operator) => Card(
                                child: ListTile(
                                  title: Text('Name: ${operator!.name}'),
                                  subtitle:
                                      Text('Designation: ${operator!.opType}'),
                                ),
                              ))
                          .toList(),
                    ),
                  );
                }),
            Center(
              child: IconButton(
                  onPressed: () async {
                    String name = '';
                    String password = '';
                    String clockNumber = '';
                    Operators? tempOp;
                    OperatorType? operatorTyp;
                    await showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Create New Operator'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Divider(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          label: Text('Name'),
                                          border: OutlineInputBorder()),
                                      onChanged: (value) {
                                        name = value;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          label: Text('Password'),
                                          border: OutlineInputBorder()),
                                      onChanged: (value) {
                                        password = value;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          label: Text('Clock Number'),
                                          border: OutlineInputBorder()),
                                      onChanged: (value) {
                                        clockNumber = value;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownMenu(
                                        onSelected: (value) =>
                                            operatorTyp = value,
                                        dropdownMenuEntries: OperatorType.values
                                            .map((opType) => DropdownMenuEntry(
                                                value: opType,
                                                label: opType.toString()))
                                            .toList()),
                                  ),
                                  Divider(),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      print(name +
                                          clockNumber +
                                          password +
                                          operatorTyp.toString());
                                      if (name.length < 4 ||
                                          clockNumber.length < 3 ||
                                          password.length < 3 ||
                                          operatorTyp == null) {
                                        Navigator.of(context).pop();
                                        return;
                                      }
                                      tempOp = Operators(
                                          name: name,
                                          opType: operatorTyp!,
                                          clockNumber: clockNumber,
                                          password: password);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Sign Up')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel'))
                              ],
                            ));

                    if (tempOp != null) {
                      viewModel.createOperator.execute(tempOp);
                      await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: ListenableBuilder(
                                    listenable: viewModel.createOperator,
                                    builder: (context, status) {
                                      if (viewModel
                                          .createOperator.isExecuting.value) {
                                        return SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      if (viewModel
                                              .createOperator.errors.value !=
                                          null) {
                                        return SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: Icon(Icons.error,
                                              color: Colors.red, size: 60),
                                        );
                                      }
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons
                                                  .check_circle_outline_rounded,
                                              color: Colors.green,
                                              size: 100,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                                child:
                                                    Text('Operator Created')),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: MaterialButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Close'),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                              ));
                    }
                  },
                  icon: Icon(
                    Icons.add_circle_outline_outlined,
                    color: Colors.blueAccent,
                    size: 100,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
