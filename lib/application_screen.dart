import 'package:demo2/auth/presentation/pages/register_screen.dart';
import 'package:demo2/counter_with_cubit/presentation/counter_screen.dart';
import 'package:demo2/genderize/presentation/genderize_screen.dart';
import 'package:demo2/posts/presentation/pages/post_screen.dart';
import 'package:flutter/material.dart';

class ApplicationScree extends StatelessWidget {
  const ApplicationScree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formation Flutter LH 03/24"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Authentication"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ));
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          ListTile(
            title: const Text("Post App"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PostScreen(),
              ));
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          ListTile(
            title: const Text("Genderize"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const GenderizeScreen(),
              ));
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          ListTile(
            title: const Text("Counter App With Cubit"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CounterScreen(),
              ));
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
