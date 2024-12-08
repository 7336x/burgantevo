import 'package:flutter/material.dart';
import '../models/trip_model.dart';

class TripsProvider with ChangeNotifier {
  List<Trip> _trips = [
    Trip(
      destination: 'Qatar',
      from: 'KW',
      to: 'QT',
      startDate: '1/12/2024',
      endDate: '1/12/2024',
      amount: '400kwd',
      totalAmount: '1000kwd',
      imagePath: 'assets/images/qatar.jpeg',
      opacity: 0.5,
      status: 'new',
    ),
    Trip(
      destination: 'Dubai',
      from: 'KW',
      to: 'UE',
      startDate: '10/10/2023',
      endDate: '10/10/2023',
      amount: '850kwd',
      totalAmount: '1000kwd',
      imagePath: 'assets/images/qatar.jpeg',
      opacity: 0.5,
      status: 'finished',
    ),
    Trip(
      destination: 'London',
      from: 'KW',
      to: 'LDN',
      startDate: '15/10/2023',
      endDate: '15/10/2023',
      amount: '550kwd',
      totalAmount: '800kwd',
      imagePath: 'assets/images/qatar.jpeg',
      opacity: 0.5,
      status: 'finished',
    ),
    Trip(
      destination: 'Paris',
      from: 'KW',
      to: 'PAR',
      startDate: '2/12/2024',
      endDate: '2/12/2024',
      amount: '900kwd',
      totalAmount: '1500kwd',
      imagePath: 'assets/images/qatar.jpeg',
      opacity: 0.5,
      status: 'new',
    ),
    Trip(
      destination: 'New York',
      from: 'KW',
      to: 'NYC',
      startDate: '20/01/2025',
      endDate: '20/01/2025',
      amount: '2000kwd',
      totalAmount: '2500kwd',
      imagePath: 'assets/images/qatar.jpeg',
      opacity: 0.5,
      status: 'upcoming',
    ),
  ];

  List<Trip> get trips => _trips;

  void addTrip(Trip trip) {
    _trips.add(trip);
    notifyListeners(); // Notify listeners when the list is updated
  }
}
