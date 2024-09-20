#!/bin/bash

# Kullanıcıdan dosya ismi alınır
read -p "Dosya ismini girin (Pascal Case): " input_name

# Snake_case formatına dönüştürme
snake_case_name=$(echo "$input_name" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')

# Dosya ve klasör isimleri
view_file="${snake_case_name}_view.dart"
viewmodel_file="${snake_case_name}_viewmodel.dart"
service_file="${snake_case_name}_service.dart"

# Klasörleri oluştur
mkdir -p ../lib/features/${snake_case_name}/view
mkdir -p ../lib/features/${snake_case_name}/viewmodel
mkdir -p ../lib/features/${snake_case_name}/service
mkdir -p ../lib/features/${snake_case_name}/model

# view dosyasını oluştur
cat > "../lib/features/${snake_case_name}/view/$view_file" <<EOL
import 'package:flutter/material.dart';

class ${input_name// /}View extends StatefulWidget {
  const ${input_name// /}View({super.key});

  @override
  State<${input_name// /}View> createState() => _${input_name// /}ViewState();
}

class _${input_name// /}ViewState extends State<${input_name// /}View> {
  @override
  Widget build(BuildContext context) {
  final viewModel = Provider.of<${input_name// /}ViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('${input_name}'),
      ),
      body: const Center(
        child: Text('${input_name}'),
      ),
    );
  }
}
EOL

# viewmodel dosyasını oluştur
cat > "../lib/features/${snake_case_name}/viewmodel/$viewmodel_file" <<EOL
import 'package:flutter/material.dart';

class ${input_name// /}ViewModel with ChangeNotifier {
  final ${input_name// /}Service _service = ${input_name// /}Service.instance;
  String? token;

  ${input_name// /}ViewModel(this.token) {
    initial();
  }

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  void initial() {}
}
EOL

# service dosyasını oluştur
cat > "../lib/features/${snake_case_name}/service/$service_file" <<EOL
class ${input_name// /}Service {
  static ${input_name// /}Service? _instance;

  static ${input_name// /}Service get instance =>
      _instance ??= ${input_name// /}Service._init();

  ${input_name// /}Service._init();
}
EOL

echo "Dosyalar ve klasörler oluşturuldu."
