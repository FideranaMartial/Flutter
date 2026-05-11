import 'package:flutter/material.dart';
import 'package:td/family_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showConfirmPassword = false;
  String _buttonText = 'Login';
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _handleButtonPress() {
    setState(() {
      if (!_showConfirmPassword) {
        // Premier clic : on montre le champ confirm password et on change le bouton
        _showConfirmPassword = true;
        _buttonText = 'Register';
      } else {
        // Deuxième clic : on peut enregistrer l'utilisateur
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final FamilyMember myFamily = FamilyMember(
      id: '1',
      name: 'Maurice',  // Mettez votre nom ici
      photoUrl: '',       // Mettez l'URL ou le chemin de votre photo
      maritalStatus: 'Marié(e) à Marceline',  // Votre situation matrimoniale
      address: 'Ambohibehasina',
      contact: '0342558404',
      relationshipToMe: 'Grand-père',
      birthDate: DateTime(1975, 03, 12), // Votre date de naissance
      profession: 'Fleuriste',
      children: [
        // Ajoutez vos enfants ici
        FamilyMember(
          id: '2',
          name: 'Martial',
          photoUrl: '',
          maritalStatus: 'Marié à Angeline',
          address: 'Manakambahiny',
          contact: '03212345648',
          relationshipToMe: 'Père',
          birthDate: DateTime(1980, 1, 1),
        ),
        FamilyMember(
          id: '2',
          name: 'Angeline',
          photoUrl: '',
          maritalStatus: 'Mariée à Martial',
          address: 'Manakambahiny',
          contact: '0331459335',
          relationshipToMe: 'Mère',
          birthDate: DateTime(1985, 1, 1),
        ),
      ],
    );

    // OU utiliser l'exemple pré-rempli :
    // final FamilyMember myFamily = FamilyTreeBuilder.createSampleFamily();

    return FamilyTreeApp(rootMember: myFamily);
  }


    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    /*return Scaffold(
      appBar: AppBar(
        
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:Center(
        child:Column(
          mainAxisAlignment : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your password',
                ),
              ),const SizedBox(height: 20),
            
            // Champ Confirm Password (apparaît seulement après clic sur Login)
            if (_showConfirmPassword)
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _showConfirmPassword ? 1.0 : 0.0,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Confirm Password',
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              
            
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleButtonPress,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: _showConfirmPassword ? Colors.green : Colors.blue,
              ),
              child: Text(
                _buttonText,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),

       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }*/
}
