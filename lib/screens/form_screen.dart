import 'package:flutter/material.dart';
import 'package:primeiro_projeto/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  ///criando controller do textformfield
  TextEditingController nameController = TextEditingController();
  TextEditingController dificuldadeController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  ///criando key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      ///Form apenas pra usar a Key
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Formulario'),
        ),
        body: Center(
          ///Center apenas pra centralizar
          child: SingleChildScrollView(
            ///SingleChildScrollView para deixar o teclado estatico
            child: Container(
              ///base
              height: 750,
              width: 375,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ///Campos de texto
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Digite o nome da tarefa';
                        }
                        return null;
                      },
                      controller: nameController,

                      ///design
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white10,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          return 'Insira uma dificuldade entre 1 e 5';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: dificuldadeController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Dificuldade',
                        fillColor: Colors.white10,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Digite a URL';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      onChanged: (text) {
                        setState(() {});
                      },
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Imagem',
                        fillColor: Colors.white10,
                        filled: true,
                      ),
                    ),
                  ),

                  ///Botão de adicionar
                  ElevatedButton(
                      onPressed: () {
                        ///uso da key
                        if (_formKey.currentState!.validate()) {
                        ///IMPORTANTE! ADICIONANDO TAREFA.
                          TaskInherited.of(widget.taskContext).newTask(
                            nameController.text,
                            imageController.text,
                            int.parse(dificuldadeController.text),
                          );
                          ///SnackBar de aviso.
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              ///Design do SnackBar basico.
                              width: 100,
                              padding: EdgeInsets.all(13),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              duration: Duration(milliseconds: 500),

                              content: const Text('Adicionado!'),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('ADD')),

                  ///Container para mostrar a imagem
                  Container(
                    ///Design
                    height: 200,
                    width: 172,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.black),
                    ),

                    ///Mostrando a imagem
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Container();
                        },

                        ///completar a imagem
                        fit: BoxFit.cover,
                      ),
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
