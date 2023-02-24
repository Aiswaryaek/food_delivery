import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/textstyles.dart';
import 'package:searchfield/searchfield.dart';

List search = [
  'electrician',
  'security',
  'cleaner',
  'ac_tech',
  'plumber',
  'cafeteria',
  'lift_tech',
  'Water',
  'organisation'
];

PreferredSize arrowAppBar(
  TextEditingController controller,
) {
  return PreferredSize(
      preferredSize: const Size.fromHeight(70.0), // here the desired height
      child: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () {
            // callback();
          },
        ),
        actions: [
          Padding(padding: const EdgeInsets.only(top: 8),child: Row(
            children: [
              SizedBox(
                width: 250,
                child: SearchField(
                  textInputAction: TextInputAction.next,
                  controller: controller,
                  searchStyle: appBarText,
                  searchInputDecoration: InputDecoration(
                    fillColor: whiteColor,
                    hoverColor: whiteColor,focusColor: whiteColor,
                    contentPadding: const EdgeInsets.only(top: 4),
                    hintText: 'Search Dish',
                    hintStyle: appBarText,
                    prefixIcon: Icon(Icons.search, color: subHeadTextColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: whiteColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: whiteColor,
                      ),
                    ),
                  ),
                  // maxSuggestionsInViewPort: 6,
                  itemHeight: 55,
                  suggestionItemDecoration: const BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.rectangle,
                  ),
                  onSuggestionTap: (x) {
                    //o tapping
                  },
                  suggestionsDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suggestions:
                  search.map((e) => SearchFieldListItem(e)).toList(),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.share, color: Colors.black),
                onPressed: () {
                  // callback();
                },
              ),
            ],
          ),)
        ],
      ));
}
