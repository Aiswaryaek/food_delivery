import 'dart:convert';

import '../models/dishes_model.dart';
import '../utilities/api_helpers.dart';

Resource<List<Datum>> getDishesApi() {
  return Resource(
      url: 'getbusinessbytimeline-petpooja-timing?business_type=1&page_id=351&user_id=367&offset=0&products_type=all&placeorder_type=all',
      parse: (response) {
        Map resultResultMap = json.decode(response.body);
        Iterable list= resultResultMap["data"];
        List<Datum> data =
        list.map((model) => Datum.fromJson(model)).toList();
        return data;
      });
}
