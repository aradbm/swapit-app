import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/location.dart';
import '../../providers/locations_provider.dart';

class LocationPicker extends ConsumerStatefulWidget {
  const LocationPicker({
    super.key,
    required TextEditingController itemLatituteController,
    required TextEditingController itemLongituteController,
  })  : _itemLatituteController = itemLatituteController,
        _itemLongituteController = itemLongituteController;

  final TextEditingController _itemLatituteController;
  final TextEditingController _itemLongituteController;

  @override
  ConsumerState<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends ConsumerState<LocationPicker> {
// ignore: no_leading_underscores_for_local_identifiers
  void addOrEditLocaion(Location? location) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(location == null ? 'Add Location' : 'Edit Location'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: widget._itemLatituteController,
              decoration: const InputDecoration(labelText: 'Latitude'),
            ),
            TextField(
              controller: widget._itemLongituteController,
              decoration: const InputDecoration(labelText: 'Longitude'),
            ),
            // button to set the location from phone

            // button to set the location from map

            
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // add location to the list
              ref.read(locationsProvider).addLocation(
                    Location(
                      latitude: double.parse(
                          widget._itemLatituteController.text.trim()),
                      longitude: double.parse(
                          widget._itemLongituteController.text.trim()),
                      locationname:
                          'Location ${ref.read(locationsProvider).locations.length + 1}',
                      id: ref.read(locationsProvider).locations.length + 1,
                    ),
                  );
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void removeLocation(Location location) {
    ref.read(locationsProvider).removeLocation(location);
  }

  @override
  Widget build(BuildContext context) {
    final userLocations = ref.watch(locationsProvider).locations;

    void pickedLocation(Location location) {
      widget._itemLatituteController.text = location.latitude.toString();
      widget._itemLongituteController.text = location.longitude.toString();
      // change all locations to not chosen except the picked one
      for (var loc in userLocations) {
        if (loc.id == location.id) {
          loc.toggleIsChosen();
        } else {
          loc.isChosen = false;
        }
      }
    }

    return SizedBox(
      width: double.infinity,
      height: 175,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Add Location'),
                onTap: () => addOrEditLocaion(null),
              ),
            ),
            ...userLocations.map(
              (e) => InkWell(
                onTap: () {
                  widget._itemLatituteController.text = e.latitude.toString();
                  widget._itemLongituteController.text = e.longitude.toString();
                  setState(() {
                    pickedLocation(e);
                  });
                },
                child: Card(
                  color: e.isChosen ? Colors.blue : Colors.white,
                  child: Row(
                    children: [
                      const Icon(Icons.location_on),
                      // Text(e.locationname),
                      Text(
                          'Lat:${e.latitude.toString()}  Long: ${e.longitude.toString()}'),
                      const Spacer(),
                      Row(
                        children: [
                          // IconButton(
                          //   onPressed: () => editLocation(e),
                          //   icon: const Icon(Icons.edit),
                          // ),
                          IconButton(
                            onPressed: () => removeLocation(e),
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
