import 'package:app_delivery/app/core/ui/base_state/base_state.dart';
import 'package:app_delivery/app/core/ui/styles/text_styles.dart';
import 'package:app_delivery/app/core/ui/widgets/delivery_app.dart';
import 'package:app_delivery/app/core/ui/widgets/delivery_button.dart';
import 'package:app_delivery/app/pages/auth/register/register_controller.dart';
import 'package:app_delivery/app/pages/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: showLoader,
          error: () {
            hideLoader();
            showError('Erro ao registrar usuário');
          },
          success: () {
            hideLoader();
            showSucess('Cadastro realizado com sucesso');
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textStyles.textTitle,
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o  seu cadastro.',
                    style: context.textStyles.textMedium.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _nameEC,
                    validator: Validatorless.required('Nome Obrigatório!'),
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail Obrigatório!'),
                      Validatorless.email('E-mail Inválido!'),
                    ]),
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha Obrigatória!'),
                      Validatorless.min(
                          6, 'Senha deve conter pelo menos 6 caracteres')
                    ]),
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirmação Obrigatória!'),
                      Validatorless.compare(
                          _passwordEC, 'Senhas não correspondem')
                    ]),
                    decoration: const InputDecoration(
                      labelText: 'Confirmar Senha',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: DeliveryButton(
                      label: 'Cadastrar',
                      onPressed: () {
                        final valid = formKey.currentState?.validate() ?? false;
                        if (valid) {
                          controller.register(
                              _nameEC.text, _emailEC.text, _passwordEC.text);
                        }
                      },
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
