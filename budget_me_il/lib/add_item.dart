
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class AddItem extends StatefulWidget {

  const AddItem({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<AddItem> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  String? selectedValue = 'Meat';
  List<String> listOfVaule = ['Meat', 'Vegdable'];

  @override
  Widget build(BuildContext context) {

    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.badge),
              labelText: 'Product Name',
              hintText: '',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return null;//'Please enter the Product Name';
              }
              return null;
            },         
          ),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              icon: Icon(Icons.category),
              labelText: 'Category',
              hintText: 'Can Leave Empty',
            ),
            value: selectedValue,
            hint: Text('Select an option'),
            isExpanded: true,
            onChanged: (newValue) {
              setState(() {
                selectedValue = newValue;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Please select an option';
              }
              return null;
            },
            items: listOfVaule.map((String val) {
                return DropdownMenuItem(
                   value: val,
                   child: Text(
                        val,                   
                         ),
                       );
                    }).toList(),
          ),
          
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
            ], 
            decoration: const InputDecoration(
              icon: Icon(Icons.paid),
              labelText: 'Price',
              hintText: '',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {

              if (value == null || value.isEmpty) {
                return 'Please enter the product price';
              }
              else if('.'.allMatches(value).length > 1)
              {
                return 'price can\'t containe more than one dot';
              }
              else if(double.parse(value) <= 0) {
                return 'Price must be positive';
              }
              return null;
            },
            
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}