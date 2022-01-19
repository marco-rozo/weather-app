import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomModal extends StatelessWidget {
  const BottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cityController = TextEditingController();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .88,
      decoration: BoxDecoration(
        color: Color(0xff6B83CD),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
            offset: Offset(-2, -2),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 3,
            width: MediaQuery.of(context).size.width * .3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 28),
            //width: MediaQuery.of(context).size.width * .9,
            padding: EdgeInsets.only(bottom: 20),
            child: TextField(
              controller: _cityController,

              //resgata o valor escrito
              //onChanged: (value) => print(value),
              onSubmitted: (value) => print(value),
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.grey,
                  ),
                  onPressed: () => _cityController.clear(),
                ),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Digite a cidade',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.zero,
                labelStyle: TextStyle(fontSize: 15, color: Colors.grey),
                focusColor: Colors.grey,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hoverColor: Colors.grey,
              ),
            ),
          ),
          Flexible(
            child: Text(
              "Lista de cidades",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
