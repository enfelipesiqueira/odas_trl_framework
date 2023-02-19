import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odas_trl_framework/constants/constants.dart';
import 'package:odas_trl_framework/models/trls/trl_model.dart';
import 'package:odas_trl_framework/providers/trl/trl_provider.dart';
import 'package:odas_trl_framework/routes.dart';
import 'package:provider/provider.dart';

import '../../models/widgets/widgets.dart';

class TrlScreen extends StatelessWidget {
  const TrlScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Consumer<TrlProvider>(builder: (_, trlRef, __) {
                final List<Widget> childrens = [];
                final bool hardware = trlRef.isHardwareSelected;
                final trl = trlRef.trl;

                childrens.add(Menus.menuTop(context));

                childrens.add(Text(
                  ('${hardware ? 'Hardware' : 'Software'} - TRL $trl'),
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: hardware ? Colors.blue[700] : Colors.green[700],
                  ),
                ));
                childrens.add(
                  CheckboxListTile(
                    title: Text(
                      TrlModel.mainIssues[trlRef.trl - 1],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: trlRef.getMainIssueChecked(),
                    onChanged: (bool? value) {
                      trlRef.mainIssueChange();
                    },
                  ),
                );

                // criando a lista de questões secundárias e seus procedimentos
                for (var i = 0;
                    i < TrlModel.getNumberSecIssues(hardware, trl);
                    i++) {
                  childrens.add(Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: CheckboxListTile(
                            title: Text(
                                TrlModel.getSecIssue(hardware, trl, i + 1)),
                            value: trlRef.getSecIssueChecked(i + 1),
                            onChanged: (bool? value) {
                              trlRef.secIssueChange(i + 1);
                            },
                          ),
                        ),
                        Buttons.bt1("Procedimentos", Colors.orange, () {
                          trlRef.setQuestion(i + 1);

                          Navigator.of(context).pushNamed(Routes.procedure);
                        }),
                      ]));
                }

                // Adicionando botões
                childrens.add(Wrap(
                    spacing: 10,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      trl > 1
                          ? Buttons.bt1(
                              "TRL ${trl - 1}",
                              hardware
                                  ? Colors.blue.shade900
                                  : Colors.green.shade900, () {
                              trlRef.setTrl(trl - 1);
                            })
                          : SizedBox(width: 100),
                      Buttons.bt1("HOME", Colors.blue, () {
                        Navigator.of(context).pushNamed(Routes.home);
                      }),
                      trl < 9
                          ? Buttons.bt1(
                              "TRL ${trl + 1}",
                              hardware
                                  ? Colors.blue.shade900
                                  : Colors.green.shade900, () {
                              trlRef.setTrl(trl + 1);
                              //Navigator.of(context).pushNamed(Routes.trl);
                            })
                          : SizedBox(width: 100),
                    ]));
                return Column(children: childrens);
              }),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
