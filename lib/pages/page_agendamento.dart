import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class PageAgendamento extends StatefulWidget {
  PageAgendamento({Key? key, required this.nome_doutor}) : super(key: key);

  late String nome_doutor;

  @override
  State<PageAgendamento> createState() => _PageAgendamentoState();
}

class _PageAgendamentoState extends State<PageAgendamento> {
  final TextEditingController controllerCPF = TextEditingController();
  final TextEditingController controllerNOME = TextEditingController();
  final TextEditingController controllerNUMERO = TextEditingController();
  final TextEditingController controllerDATA = TextEditingController();
  final TextEditingController controllerHORARIO = TextEditingController();
  final formatdata = DateFormat("dd-MM-yyyy");
  final formathorario = DateFormat("hh:mm");
  final format = DateFormat("dd-MM-yyyy HH:mm");
  final dropvalue = ValueNotifier('');
  final dropOpcoes = ['Dr.João', 'Dr.Amanda', 'Dr.Antônio'];
  final CollectionReference _clientes =
      FirebaseFirestore.instance.collection('odontolife');
  Future<QuerySnapshot>? posdocumentList;
  Future<QuerySnapshot>? snapshot;
  String userNametxt = '';
  int qt_data = 0;
  bool dr_joao_cheio = true;
  late String botao_horario;
  var dia;
  bool visivel = false;
  int teste = 0;

  initProcura(String txtEntered) {
    qt_data = 0;

    posdocumentList = FirebaseFirestore.instance
        .collection('odontolife')
        .where('data', isEqualTo: txtEntered)
        .get();
    setState(() {
      posdocumentList!.then((value) => value.docs.forEach((element) {
            print(element.data());
            if (element['horario'] == '10H(AM)') {
              setState(() {
                qt_data += 1;
                print(qt_data);
              });

              // print('Dr1: ${dr_joao_cheio}');
            }
            teste += 1;
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Informe os seus dados"),
      ),
      body: ListView(
        padding: EdgeInsets.all(32),
        children: [
          TextField(
            controller: controllerCPF,
            decoration: InputDecoration(
              labelText: "CPF",
            ),
          ),
          TextField(
            controller: controllerNOME,
            decoration: InputDecoration(labelText: "NOME"),
          ),
          TextField(
            controller: controllerNUMERO,
            decoration: InputDecoration(labelText: "NÚMERO DE WHATSAPP"),
          ),

/*
          DateTimeField(
            format: formatdata,
            controller: controllerDATA,
            decoration: InputDecoration(labelText: "DATA E HORARIO"),
            onShowPicker: (context, currentValue) async {
              final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2022),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
              if (date != null) {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                return DateTimeField.combine(date, time);
              } else {
                return currentValue;
              }
            },
          ),
*/

          DateTimeField(
            decoration: InputDecoration(labelText: "DATA"),
            format: formatdata,
            controller: controllerDATA,
            onChanged: (textEntered) {
              setState(() {
                userNametxt = controllerDATA.text;
                dia = textEntered!.weekday;
                print(controllerDATA.text);
                teste+=1;
                print(teste);

                //print('datetime(dr_joaocheio): ${dr_joao_cheio}');
                // print('visivel: ${visivel}');
              });
              initProcura(controllerDATA.text);
            },
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  firstDate: DateTime(2022),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
          ),
          /*
          DateTimeField(
            controller: controllerHORARIO,
            format: formathorario,
            decoration: InputDecoration(labelText: "Horário"),
            onShowPicker: (context, currentValue) async {
              final time = await showTimePicker(
                context: context,
                initialTime:
                TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.convert(time);
            },
          ),
*/
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: qt_data <= 10 && teste != 0 && dia!= 5,
            maintainState: true,
            maintainSize: true,
            maintainAnimation: true,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    botao_horario = '10H(AM)';
                    print(dia);
                  },
                  child: Text('10H(AM)', style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.all(12),
                  ),
                )
              ],
            ),
          ),
          Visibility(
              visible: qt_data > 7 || teste == 0 && dia!= 5,
              maintainState: true,
              maintainSize: true,
              maintainAnimation: true,
              child: Text('Nenhum horário disponível para este dia')),
          Visibility(
            visible: dia == 5,
            child: Text('O ${widget.nome_doutor} não atende neste dia'),
            maintainState: true,
            maintainSize: true,
            maintainAnimation: true,
          ),
          /*
          FutureBuilder<QuerySnapshot>(
              future: posdocumentList, builder: (context, snapshot) {
            if (snapshot.hasData) {
              snapshot.data!.docs.forEach((element) {
                if(element['data']== '10H(AM)'){
                  qt_data +=1;
                  if(qt_data>3){
                    dr_joao_cheio=true;
                  }
                }


              });

            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),*/

          const SizedBox(
            height: 64,
          ),
          ElevatedButton(
              onPressed: () {
                print(dr_joao_cheio);
                print(qt_data);
                /*
                final json = {
                  'nome': controllerNOME.text,
                  'cpf': controllerCPF.text,
                  'número de whatsapp': controllerNOME.text,
                  'data': DateTime.parse(controllerDATA.text),
                  'horario': DateTime.parse(controllerHORARIO.text),
                };*/
                createUser(
                    nome: controllerNOME.text,
                    cpf: controllerCPF.text,
                    numero: controllerNUMERO.text,
                    data: controllerDATA.text,
                    horario: botao_horario,
                    doutor: widget.nome_doutor);
                Navigator.pop(context);
              },
              child: Text("AGENDAR"))
        ],
      ),
    );
  }

  Future createUser({
    required String nome,
    required String cpf,
    required String numero,
    required String data,
    required String horario,
    required String doutor,
  }) async {
    //referencia do documento
    var db =
        FirebaseFirestore.instance; //instanciado a classe de coneção com o db
    //db.collection("odontolife").doc(controllerCPF.text);

    final json = {
      'nome': nome,
      'cpf': cpf,
      'número de whatsapp': numero,
      'data': data,
      'horario': horario,
      'doutor': doutor,
    };

    db.collection("odontolife").doc(controllerCPF.text).set(json);
  }
}

class User {
  late String cpf;
  late String nome;
  late int age;
  late DateTime data;

  User({
    this.cpf = '',
    required this.nome,
    required this.age,
    required this.data,
  });
/*
  verificarHorarios(){
    FutureBuilder<QuerySnapshot>(future: posdocu, builder: (context, snapshot){

    });
  }
*/

}
