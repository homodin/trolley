import 'package:flutter/material.dart';
import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/features/models/home_model.dart';

class CustomDialogs {
  AlertDialog authoriseUser(BuildContext context, HomeModel viewModel) {
    String clockNumber = '';
    return AlertDialog(
      title: Text('Authorization Required'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                clockNumber = value;
              },
              decoration: InputDecoration(
                  label: Text('Enter Authorization Code'),
                  border: OutlineInputBorder()),
            ),
          ),
          Divider()
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop(await viewModel.getOperator(clockNumber));
          },
          child: Text('Authorize'),
        ),
        SizedBox(
          width: 10,
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop(null);
          },
          child: Text('Cancel'),
        )
      ],
    );
  }

  Builder authorizationResult(BuildContext context, Operators? op) {
    return Builder(builder: (context) {
      if (op != null) {
        Future.delayed(Duration(seconds: 2), () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        });
      }

      return AlertDialog(
        title:
            Text(op == null ? 'Authorization Failed' : 'Authorization Success'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Divider()],
        ),
        actions: [
          if (op == null)
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Acknowledge and Close'))
        ],
      );
    });
  }
}
