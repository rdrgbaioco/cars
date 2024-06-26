import 'package:cars/src/core/domain/entities/user.dart';
import 'package:cars/src/views/auth/store/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({
    required this.store,
    super.key,
  });

  final AuthStore store;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  final formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Cadastrar novo usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  }
                  // Regular expression for email validation
                  String pattern = r'^[^@]+@[^@]+\.[^@]+';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return 'Insira um email valido!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Senha'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  }

                  if (value.length < 4) {
                    return 'Senha muito curta!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 56),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final user = User(
                      name: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    await widget.store.createUser(user);
                    if (!context.mounted) return;
                    context.go('/');
                  }
                },
                child: const Text('Cadastrar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
