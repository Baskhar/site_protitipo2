// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

class AgendamentoComposer extends StatefulWidget {
  const AgendamentoComposer({Key? key}) : super(key: key);

  @override
  State<AgendamentoComposer> createState() => _AgendamentoComposerState();
}

class _AgendamentoComposerState extends State<AgendamentoComposer> {
  final TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final formValueVN = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        onChanged: (){
          formValueVN.value = formKey.currentState?.validate() ?? false;//se for nulo ele vai validar, senão ele vai retornar nulo
        },
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(labelText: "nome"),
              validator: (String? value){
                if(value == null || value.isEmpty){
                  return "Nome é obrigatório" ;
                }
              },
            ),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(labelText: "cpf"),
              validator: (String? value){
                if(value == null || value.isEmpty){
                  return "cpf é obrigatório" ;
                }
              },
            ),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(labelText: "número do whatsapp"),
              validator: (String? value){
                if(value == null || value.isEmpty){
                  return "número do whatsapp é obrigatório";
                }
              },
            ),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(labelText: "dia/mes/ano"),
              validator: (String? value){
                if(value == null || value.isEmpty){
                  return "data é obrigatório" ;
                }
              },
            ),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(labelText: "horário"),
              validator: (String? value){
                if(value == null || value.isEmpty){
                  return "horário é obrigatório" ;
                }
                String horario = controller.text;
              },
            ),
            ValueListenableBuilder<bool>(
              valueListenable: formValueVN,
              builder: (_, formValid, Child) {
                return ElevatedButton(
                  onPressed: !formValid ? null : () async {
                    //função resposável por receber os dados do test_composer
                    WidgetsFlutterBinding.ensureInitialized();
                    await Firebase.initializeApp(
                      //inicializando a conexão
                      options: DefaultFirebaseOptions.currentPlatform,
                    ); //inicianizando a conexão
                    var db =
                        FirebaseFirestore.instance; //instanciado a classe de coneção com o db
                   // db.collection("mensagens").doc("agendamenteos").set(); //escrevendo da
                  }, style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 500),
                ), child: Icon(Icons.add),);
              },
            ),
],
        ),
      ),
    );
  }
/*
  void salvando_agendamento(String horario)async{
      //função resposável por receber os dados do test_composer
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        //inicializando a conexão
        options: DefaultFirebaseOptions.currentPlatform,
      ); //inicianizando a conexão
      var db =
          FirebaseFirestore.instance; //instanciado a classe de coneção com o db
      db.collection("mensagens").doc("agendamenteos").set(); //escrevendo dados



    }
    */


}
