import 'package:dictionary/library.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
 final TextEditingController wordController = TextEditingController();
 final TextEditingController translationController = TextEditingController();
 final TextEditingController exampleController = TextEditingController();

  late bool isPublic;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child:CustomTextField(controller: wordController, title: "Word"), ),
                  const SizedBox(width: 10),
                  Expanded(child: CustomTextField(controller: translationController, title: "Translation"),),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(controller: exampleController, title: "Example"),
              const SizedBox(height: 20),
              Container(
                height: MediaQuery.sizeOf(context).width,
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.fromBorderSide(BorderSide(width: 2,color: Colors.white)),
                ),
                child: const Icon(Icons.add,size: 100,),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                   Checkbox(
                          value: true,
                          onChanged: (value) {
                          }),
                  const SizedBox(width: 10),
                  Text(
                    I18N.checked,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.cloud_upload_rounded),
      ),
    );
  }
}
