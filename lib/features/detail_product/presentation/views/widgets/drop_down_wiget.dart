import 'package:flutter/material.dart';
import 'package:levado/Core/Utils/styles.dart';
import 'package:levado/core/Utils/colors.dart';

class DropDownWidget extends StatefulWidget {
  final List<String> itemList;
  final String selectedItem;
  final String name;
  final Function(String) onItemSelected;

  const DropDownWidget({
    Key? key,
    required this.itemList,
    required this.name,
    required this.selectedItem,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  DropDownWidgetState createState() => DropDownWidgetState();
}

class DropDownWidgetState extends State<DropDownWidget> {
  late String selectedValue;

  @override
  void initState() {
    selectedValue = widget.selectedItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(widget.name, style: Styles.textStyle16.copyWith(color: AppColor.textBodyColor)),
          const SizedBox(width: 10),
          DropdownButton<String>(
            value: selectedValue,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedValue = newValue;
                });
                 widget.onItemSelected(newValue);
              }
            },
            items: widget.itemList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
