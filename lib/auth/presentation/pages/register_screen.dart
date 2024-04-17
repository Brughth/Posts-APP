import 'package:flutter/material.dart';

import '../../../shared/widgets/app_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Creer un compte"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        children: [
          Row(
            children: [
              Expanded(
                child: AppInput(
                  label: 'Nom',
                  hint: 'Nom',
                  controller: firstNameController,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: AppInput(
                  label: 'Prenom',
                  hint: 'Prenom',
                  controller: lastNameController,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
