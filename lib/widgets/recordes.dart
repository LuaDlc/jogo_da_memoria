import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/theme.dart';

import '../constants.dart';
import '../pages/recordes_page.dart';

class Recordes extends StatefulWidget {
  const Recordes({Key? key}) : super(key: key);

  @override
  State<Recordes> createState() => _RecordesState();
}

class _RecordesState extends State<Recordes> {
  //funcao que recebe o modo como parametro e chama a page que queremos
  showRecordes(Modo modo) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => RecordesPage(modo: modo)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Recordes',
                style: TextStyle(color: Round6Theme.color, fontSize: 22),
              ),
            ),
            ListTile(
              title: const Text('Modo Normal'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecordes(Modo.normal),
            ),
            ListTile(
              title: const Text('Modo Round 6'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecordes(Modo
                  .round6), // chama a funcao que foi criada para levar á pagina
            )
          ],
        ),
      ),
    );
  }
}
