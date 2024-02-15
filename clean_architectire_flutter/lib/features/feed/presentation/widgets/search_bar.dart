// Import necessary libraries
import 'package:flutter/material.dart';

class BeautifulSearchBar extends StatefulWidget {
  final String hintText; // Hint text to display inside the search bar
  final Color backgroundColor; // Background color of the search bar
  final Color borderColor; // Border color of the search bar
  final double borderRadius; // Border radius of the search bar
  final TextStyle hintTextStyle; // TextStyle for the hint text
  final TextStyle textStyle; // TextStyle for the entered text
  final Function(String) onSearch; // Callback function when the user searches

  const BeautifulSearchBar({
    Key? key,
    this.hintText = "Search...",
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey,
    this.borderRadius = 20.0,
    this.hintTextStyle = const TextStyle(color: Colors.grey),
    this.textStyle = const TextStyle(color: Colors.black),
    required this.onSearch,
  }) : super(key: key);

  @override
  State<BeautifulSearchBar> createState() => _BeautifulSearchBarState();
}

class _BeautifulSearchBarState extends State<BeautifulSearchBar> {
  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(color: widget.borderColor),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _searchTextController,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: widget.hintTextStyle,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                // Remove text field's default padding
              ),
              style: widget.textStyle,
              onSubmitted: (value) {
                setState(() {
                  // Clear the search bar after search submission
                  _searchTextController.clear();
                });
                widget.onSearch(value);
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
            onPressed: () {
              widget.onSearch(_searchTextController.text);
              // Clear the search bar after button press
              _searchTextController.clear();
            },
          ),
        ],
      ),
    );
  }
}
