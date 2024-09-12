// ignore: file_names
import 'package:flutter/material.dart';
import 'notCodeRegister.dart';

// ignore: camel_case_types
class registerPromotion extends StatefulWidget {
  const registerPromotion({Key? key}) : super(key: key);

  @override
  State<registerPromotion> createState() => _registerPromotion();
}

// ignore: camel_case_types
class _registerPromotion extends State<registerPromotion> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Obtém o tema atual
    final theme = Theme.of(context);
    
    return Theme(
      // Usa o tema atual, mas sobrescreve as cores primárias e de fundo
      data: theme.copyWith(
        primaryColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
        // Adicione outras personalizações de cor aqui, se necessário
      ),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Registrar promoción',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: codeController,
                  decoration: InputDecoration(
                    labelText: 'Código de 6 dígitos',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es obligatorio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const notCodeRegister();
                          },
                        );
                      },
                      child: Text('No tengo código'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          final String code = codeController.text;
                          print('Código ingresado: $code');
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('Validar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}