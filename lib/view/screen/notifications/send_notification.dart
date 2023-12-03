import 'package:admin_app/controller/notification/send_notification_controller.dart';
import 'package:admin_app/core/shared/custom_appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendNotificationView extends StatelessWidget {
  const SendNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SendNOtificationController());
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    List<String> selectedUsers = [];
    List<String> allUsers = [
      'User 1',
      'User 2',
      'User 3',
      'User 4',
      // Add more users as needed
    ];
    return Scaffold(
      appBar: customAppBarTitle('Send Notification', true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Users',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: List.generate(
                allUsers.length,
                (index) => FilterChip(
                  label: Text(allUsers[index]),
                  selected: selectedUsers.contains(allUsers[index]),
                  onSelected: (selected) {
                    // setState(() {
                    //   if (selected) {
                    //     selectedUsers.add(allUsers[index]);
                    //   } else {
                    //     selectedUsers.remove(allUsers[index]);
                    //   }
                    // });
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Notification Title',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Enter title...',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Notification Content',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: contentController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Enter content...',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logic to send notifications
                print('Sending notifications to: $selectedUsers');
                print('Title: ${titleController.text}');
                print('Content: ${contentController.text}');
                // Add your notification sending code here
              },
              child: Text('Send Notifications'),
            ),
          ],
        ),
      ),
    );
  }
}
