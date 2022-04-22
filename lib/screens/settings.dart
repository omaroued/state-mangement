import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/models/theme_model.dart';

class Settings extends StatelessWidget {

  static void create(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Settings._()));
  }


  const Settings._({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        children: [

          Consumer<ThemeModel>(builder: (context,model,_){
            return ListTile(
              title: const Text("Dark mode"),
              trailing: Switch(value: model.isDark, onChanged: (value){
                if(model.isDark){
                  model.changeTheme(ThemeModel.light);
                }else{
                  model.changeTheme(ThemeModel.dark);

                }


              }),
            );

          })


        ],
      ),
    );
  }
}
