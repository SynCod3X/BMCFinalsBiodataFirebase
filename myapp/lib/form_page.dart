import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController lastController = TextEditingController();
  final TextEditingController firstController = TextEditingController();
  final TextEditingController middleController = TextEditingController();
  final TextEditingController addController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController noController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nationController = TextEditingController();
  final TextEditingController relController = TextEditingController();
  final TextEditingController civilController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveData() async {
    if (lastController.text.trim().isEmpty ||
        firstController.text.trim().isEmpty ||
        middleController.text.trim().isEmpty ||
        addController.text.trim().isEmpty ||
        ageController.text.trim().isEmpty ||
        birthController.text.trim().isEmpty ||
        genderController.text.trim().isEmpty ||
        noController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        nationController.text.trim().isEmpty ||
        relController.text.trim().isEmpty ||
        civilController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    await firestore.collection('students').add({
      'Last Name: ': lastController.text.trim(),
      'First Name: ': firstController.text.trim(),
      'Middle Name: ': middleController.text.trim(),
      'Address: ': addController.text.trim(),
      'Age: ': ageController.text.trim(),
      'Birthdate: ': birthController.text.trim(),
      'Gender: ': genderController.text.trim(),
      'Contact No.: ': noController.text.trim(),
      'Email Address: ': emailController.text.trim(),
      'Nationality: ': nationController.text.trim(),
      'Religion: ': relController.text.trim(),
      'Civil Status: ': civilController.text.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data saved successfully')),
    );

    lastController.clear();
    firstController.clear();
    middleController.clear(); 
    addController.clear();
    ageController.clear();
    birthController.clear();
    genderController.clear();
    noController.clear();
    emailController.clear();
    nationController.clear();
    relController.clear();
    civilController.clear();
  }

  @override
  void dispose() {
    lastController.dispose();
    firstController.dispose();
    middleController.dispose();
    addController.dispose();
    ageController.dispose();
    birthController.dispose();
    genderController.dispose();
    noController.dispose();
    emailController.dispose();
    nationController.dispose();
    relController.dispose();
    civilController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bio Data'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: lastController,
              decoration: const InputDecoration(
                labelText: 'Last Name:',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: firstController,
              decoration: const InputDecoration(
                labelText: 'First Name:',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: middleController,
              decoration: const InputDecoration(
                labelText: 'Middle Name:',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: addController,
              decoration: const InputDecoration(
                labelText: 'Address:',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: 'Age:',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: birthController,
              decoration: const InputDecoration(
                labelText: 'Birthdate:',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: genderController,
              decoration: const InputDecoration(
                labelText: 'Gender:',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: noController,
              decoration: const InputDecoration(
                labelText: 'Contact Number:',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email Address:',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: nationController,
              decoration: const InputDecoration(
                labelText: 'Nationality:',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: relController,
              decoration: const InputDecoration(
                labelText: 'Religion:',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: civilController,
              decoration: const InputDecoration(
                labelText: 'Civil Status:',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveData,
              child: const Text('Save to Firebase'),
            ),
          ],
        ),
      ),
    );
  }
}