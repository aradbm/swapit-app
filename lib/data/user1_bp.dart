import 'dart:io';
import 'package:flutter/material.dart';
import '../models/bp_item.dart';
import '../models/location.dart';

List<BackPackItem> dummyBackpackItems = [
  BackPackItem(
    "Spacious and durable backpack perfect for hiking.",
    Colors.red,
    File('assets/path_to_common_image.png'),
    id: "BP001",
    name: "Hiking Pro",
    price: 5999,
    location: const Location(latitude: 1, longitude: 1),
    category: "Backpacks",
    userID: "0008",
  ),
  BackPackItem(
    "Stylish backpack for everyday use.",
    Colors.blue,
    File('assets/path_to_common_image.png'),
    id: "BP002",
    name: "Urban Style",
    price: 4999,
    location: const Location(latitude: 1, longitude: 1),
    category: "Backpacks",
    userID: "0008",
  ),
  BackPackItem(
    "Lightweight backpack for students.",
    Colors.green,
    File('assets/path_to_common_image.png'),
    id: "BP003",
    name: "Student Buddy",
    price: 2999,
    location: const Location(latitude: 1, longitude: 1),
    category: "Backpacks",
    userID: "0008",
  ),
  BackPackItem(
    "Premium leather backpack for professionals.",
    Colors.brown,
    File('assets/path_to_common_image.png'),
    id: "BP004",
    name: "Leather Luxe",
    price: 7999,
    location: const Location(latitude: 1, longitude: 1),
    category: "Backpacks",
    userID: "0008",
  ),
  BackPackItem(
    "Compact backpack for minimalists.",
    Colors.black,
    File('assets/path_to_common_image.png'),
    id: "BP005",
    name: "Mini Pack",
    price: 3999,
    location: const Location(latitude: 1, longitude: 1),
    category: "Backpacks",
    userID: "0008",
  ),
];
