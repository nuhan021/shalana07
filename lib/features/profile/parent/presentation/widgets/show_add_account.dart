import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shalana07/core/common/widgets/common_button.dart';

class AddAccountSheet extends StatelessWidget {
  const AddAccountSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 300, // adjust as needed
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add Account",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: "Account Name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
        CommonButton(title: "Add Account", onPressed: (){
            Get.back();
        },),
        ],
      ),
    );
  }
}
