import 'package:flutter/material.dart';

import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final void Function(Settings) onSettingsChanged;
  const SettingsScreen({
    Key? key,
    required this.settings,
    required this.onSettingsChanged,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required void Function(bool) onChanged,
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch(
                title: 'Sem Glutén',
                subtitle: 'Só Exibi só refeições sem glutén!',
                value: settings!.isGlutenFree,
                onChanged: (value) => setState(
                  () => settings!.isGlutenFree = value,
                ),
              ),
              _createSwitch(
                title: 'Sem Lactose',
                subtitle: 'Só Exibi só refeições sem lactose!',
                value: settings!.isLactoseFree,
                onChanged: (value) => setState(
                  () => settings!.isLactoseFree = value,
                ),
              ),
              _createSwitch(
                title: 'Vegana',
                subtitle: 'Só Exibi refeições veganas!',
                value: settings!.isVegan,
                onChanged: (value) => setState(
                  () => settings!.isVegan = value,
                ),
              ),
              _createSwitch(
                title: 'Vegetariana',
                subtitle: 'Só Exibi refeições vegetarianas!',
                value: settings!.isVegetarian,
                onChanged: (value) => setState(
                  () => settings!.isVegetarian = value,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
