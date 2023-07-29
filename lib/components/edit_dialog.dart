import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../store/item_model.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/helper_functions.dart';

class EditPopup extends StatefulWidget {
  EditPopup(
      {required this.index, required this.item, required this.updateItem});

  final int index;
  final ItemModel item;
  final Function updateItem;

  @override
  State<EditPopup> createState() => _EditPopupState();
}

class _EditPopupState extends State<EditPopup> {
  TextEditingController? _descriptionController;
  TextEditingController? _amountController;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _descriptionController =
        TextEditingController(text: widget.item.description);
    _amountController = TextEditingController(text: widget.item.amount);
    _selectedDate = widget.item.date as DateTime;
  }

  @override
  void dispose() {
    _descriptionController!.dispose();
    _amountController!.dispose();
    super.dispose();
  }

  Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate!,
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        locale: Locale("he", "IL"), // Set the locale to English (United States)
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.dark(
              background: main_color,
              onBackground: main_color,
              primary: Colors.white70,
              onSurface: Colors.white70,
            )),
            child: child!,
          );
        });
    setState(() {
      _selectedDate = picked != null ? picked : _selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: main_color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Adjust the value as needed
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              maxLength: 40,
              cursorColor: Colors.white30,
              textAlign: TextAlign.center,
              style: kTextAlertEditDialog,
              controller: _descriptionController,
              decoration: InputDecoration(
                counterText: "",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.15, color: Colors.white70),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.15, color: Colors.white70),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              maxLength: 8,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter
                    .digitsOnly // Input filter to allow only digits
              ],
              controller: _amountController,
              style: kTextAlertEditDialog,
              decoration: InputDecoration(
                counterText: "",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.15, color: Colors.white70),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.15, color: Colors.white70),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  HelperFunctions.getDateFormat(_selectedDate as DateTime)!
                      .toString(),
                  style: kTextAlertEditDialog,
                ),
                SizedBox(width: 10),
                IconButton(
                    icon: Icon(Icons.date_range),
                    color: Colors.white30,
                    onPressed: () {
                      setState(() {
                        selectDate(context);
                      });
                    }),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'ביטול',
                    style: TextStyle(
                        fontFamily: 'SecularOne',
                        color: Colors.white54,
                        fontSize: 18),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    String desc = _descriptionController!.text;
                    String amount = _amountController!.text;
                    widget.updateItem(desc, amount, _selectedDate as DateTime);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'אישור',
                    style: TextStyle(
                        fontFamily: 'SecularOne',
                        color: Colors.white54,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
