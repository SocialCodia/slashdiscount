import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Welcome Sami",style: TextStyle(color: Colors.grey),),
                  Text("SAIDAPET",style: TextStyle(color: Colors.grey),),
                  Text("13, Muthaiyal Streetm Little Mount, saidapet, Chennai 600015",style: TextStyle(color: Colors.grey),),
                ],
              ),
              const Icon(Icons.person)
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RoundedInputField(hintText: "Search Medicine, Doctors...", controller: searchController, icon: Icons.search),
            const SizedBox(
              height: 20,
            ),
            const ButtonPrescription(),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("1 : Paracetomal 120mg 2peace",style: TextStyle(color: Colors.black,fontSize: 18),),
                  Text("2 : Paracetomal 120mg 2peace",style: TextStyle(color: Colors.black,fontSize: 18),),
                  Text("3 : Paracetomal 120mg 2peace",style: TextStyle(color: Colors.black,fontSize: 18),),
                ],
              ),
            ),
            const Spacer(),
            RoundedButton(text: "Add to Cart", onPress: ()=>print("Add to cart"))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Doctor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (i)=>print('Clicked $i'),
      ),
    );
  }
}

class ButtonPrescription extends StatelessWidget {
  const ButtonPrescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Container(
        height: 80,
        width: 80,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.teal.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(Icons.add),
      ),
        const SizedBox(
          height: 5,
        ),
        const Text("Upload Prescription")
    ]
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final String hintText,counter;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType keyboardType;
  final bool isEnabled;
  const RoundedInputField(
      {Key? key,
        required this.hintText,
        required this.controller,
        required this.icon,
        this.isEnabled = true,
        this.counter = '',
        this.keyboardType = TextInputType.text
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.85,
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100)),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            counter: counter.isEmpty ? null : Text(counter),
            prefixIcon: Icon(icon),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border: InputBorder.none
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final double textSize;

  const RoundedButton({Key? key, required this.text, required this.onPress,this.textSize = 17})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
        onTap: () => onPress() ,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: size.width * 0.75,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white,fontSize: textSize),
          ),
        ),
      );
  }
}
