import 'package:flutter/material.dart';
import '../../services/auth/auth_services.dart';
import '../../utils/database_helper.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreenState createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>(); 
  final _authServices = AuthServices();
  bool _loading - false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  Future<void> _registerUser() async {
    if(_form.currentState!.validate()) {
      try {
        setState(() => _loading = true);

        final user = Usuario(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          phone: _phoneController.text,
          tipoUsuario: 'cidadao',
          especialidade: '',
          dataCadastro: DateTime.now().toString(),
          localizacao: '',
        );
        final sucess = await _authServices.registerUser(user);

        setState(() => _loading = false);
        if(sucess) {
          ScaffoldMessenger.of(context).showSnackBar (
            
          );
        }
          
        }
      }
    }

