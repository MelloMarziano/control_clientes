import 'package:control_client/models/address.dart';
import 'package:control_client/models/customer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CustomerDatabase {
  static Future<Database> _openDatabase() async {
    return openDatabase(join(await getDatabasesPath(), 'customerDB.db'),
        onCreate: (db, version) {
      db.execute(
        "CREATE TABLE customer (customerId INTEGER PRIMARY KEY, name TEXT, phone TEXT)",
      );

      db.execute(
        "CREATE TABLE address (addressId INTEGER PRIMARY KEY, address TEXT, customerId INTEGER)",
      );
    }, version: 1);
  }

  static Future insertCustomer(Customer customer) async {
    Database db = await _openDatabase();
    return db.insert("customer", customer.toMap());
  }

  static Future insertAddress(Address address) async {
    Database db = await _openDatabase();
    return db.insert("address", address.toMap());
  }

  static Future<List<Customer>> customer() async {
    Database db = await _openDatabase();
    final List<Map<String, dynamic>> customerMap = await db.query("customer");
    return List.generate(
        customerMap.length,
        (i) => Customer(
            customerId: customerMap[i]['customerId'],
            name: customerMap[i]["name"],
            phone: customerMap[i]["phone"]));
  }
}
