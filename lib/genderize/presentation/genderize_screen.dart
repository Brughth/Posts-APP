import 'package:demo2/genderize/data/genderize_model.dart';
import 'package:demo2/genderize/data/genderize_repository.dart';
import 'package:demo2/shared/widgets/app_input.dart';
import 'package:flutter/material.dart';

class GenderizeScreen extends StatefulWidget {
  const GenderizeScreen({super.key});

  @override
  State<GenderizeScreen> createState() => _GenderizeScreenState();
}

class _GenderizeScreenState extends State<GenderizeScreen> {
  late TextEditingController _nameController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GenderizeRepository repository = GenderizeRepository();
  GenderizeModel? genderize;

  bool _isLoading = false;

  String? message;

  @override
  void initState() {
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Genderize"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          children: [
            AppInput(
              controller: _nameController,
              label: 'Prenom',
              hint: 'Entrez votre prenom',
              autofillHints: [AutofillHints.name],
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Prenon requis";
                }

                if (value!.length < 3) {
                  return "Doit avoir min 3 caractaire";
                }
                return null;
              },
            ),
            const SizedBox(height: 40),
            if (message != null)
              Text(
                message!,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 40),
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(),
              )
            else
              OutlinedButton.icon(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      setState(() {
                        _isLoading = true;
                        message = null;
                      });
                      var result = await repository.getGenderProbability(
                        name: _nameController.text,
                      );
                      setState(() {
                        _isLoading = false;
                        genderize = result;
                      });
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                        builder: (_) {
                          return SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 10,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: CircularProgressIndicator.adaptive(
                                    value: genderize?.probability,
                                    strokeWidth: 10,
                                  ),
                                ),
                                Text("Name: ${genderize?.gender}"),
                                Text("Count: ${genderize?.count}"),
                                Text("probability: ${genderize?.probability}"),
                                Text("Genter: ${genderize?.gender}"),
                              ],
                            ),
                          );
                        },
                      );
                    } catch (e) {
                      print(e);
                      setState(() {
                        _isLoading = false;
                        message = e.toString();
                      });
                    }
                  }
                },
                icon: const Icon(Icons.arrow_forward_ios),
                label: const Text(
                  "Valider",
                ),
              )
          ],
        ),
      ),
    );
  }
}
