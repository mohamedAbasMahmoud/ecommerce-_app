import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget {
  const customAppBar({
    super.key,
    required this.titleAppbar,
    this.onPressedSearch,

    this.onPressedfavorite,
    required this.onChanged,
    required this.myController,
  });
  final String titleAppbar;
  final void Function()? onPressedSearch;
  final void Function()? onPressedfavorite;
  final void Function(String)? onChanged;
  final TextEditingController myController;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: myController,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: titleAppbar,
                hintStyle: TextStyle(fontSize: 18),
                prefixIcon: IconButton(
                  onPressed: onPressedSearch,
                  icon: Icon(Icons.search_rounded),
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // SizedBox(width: 12),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.grey.shade200,

          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   height: 55,
          //   child: IconButton(
          //     onPressed: onPressednotification,
          //     icon: Icon(
          //       Icons.notifications_active_outlined,
          //       size: 35,
          //       color: Colors.grey.shade700,
          //     ),
          //   ),
          // ),
          SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,

              borderRadius: BorderRadius.circular(12),
            ),
            height: 65,
            child: IconButton(
              onPressed: onPressedfavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 35,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
