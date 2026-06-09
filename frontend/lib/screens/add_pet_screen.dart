import 'package:flutter/material.dart';

import '../services/pet_service.dart';
import '../widgets/app_menu_drawer.dart';
import '../widgets/custom_app_bar.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _petService = PetService();
  bool _isSaving = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();

  String _especie = 'CACHORRO';
  String _sex = 'MACHO';
  String _porte = 'MEDIO';
  String _neutered = 'Sim';
  String _vaccinated = 'Sim';

  static const _especieOptions = <String>['CACHORRO', 'GATO'];
  static const _sexOptions = <String>['MACHO', 'FEMEA'];
  static const _porteOptions = <String>['PEQUENO', 'MEDIO', 'GRANDE'];
  static const _yesNoOptions = <String>['Sim', 'Não'];

  @override
  void dispose() {
    _nameController.dispose();
    _breedController.dispose();
    _ageController.dispose();
    _locationController.dispose();
    _aboutController.dispose();
    _imageUrlController.dispose();
    _whatsappController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    final nome = _nameController.text.trim();

    try {
      await _petService.createPet(
        nome: nome,
        especie: _especie,
        raca: _breedController.text.trim(),
        idade: _ageController.text.trim(),
        sexo: _sex,
        porte: _porte,
        castrado: _neutered == 'Sim',
        vacinado: _vaccinated == 'Sim',
        localizacao: _locationController.text.trim(),
        descricao: _aboutController.text.trim(),
        imagemUrl: _imageUrlController.text.trim().isNotEmpty
            ? _imageUrlController.text.trim()
            : 'https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?auto=format&fit=crop&w=1200&q=80',
        whatsapp: _whatsappController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '$nome cadastrado com sucesso!',
            style: const TextStyle(fontFamily: 'Nunito'),
          ),
          backgroundColor: const Color(0xFF006DA6),
        ),
      );
      Navigator.popUntil(context, (route) => route.isFirst);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
            style: const TextStyle(fontFamily: 'Nunito'),
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const AppMenuDrawer(),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Adicionar Pet',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF003366),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Preencha os dados do animal para disponibilizá-lo para adoção.',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 15,
                    height: 1.45,
                    color: Color(0xFF5F6C7B),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome do pet',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.pets),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe o nome do pet';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                _buildDropdown(
                  label: 'Espécie',
                  value: _especie,
                  items: _especieOptions,
                  onChanged: (value) => setState(() => _especie = value!),
                ),
                const SizedBox(height: 12),
                _buildDropdown(
                  label: 'Sexo',
                  value: _sex,
                  items: _sexOptions,
                  onChanged: (value) => setState(() => _sex = value!),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _breedController,
                  decoration: const InputDecoration(
                    labelText: 'Raça',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe a raça';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(
                    labelText: 'Idade',
                    border: OutlineInputBorder(),
                    hintText: 'Ex.: 2 anos',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe a idade';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                _buildDropdown(
                  label: 'Porte',
                  value: _porte,
                  items: _porteOptions,
                  onChanged: (value) => setState(() => _porte = value!),
                ),
                const SizedBox(height: 12),
                _buildDropdown(
                  label: 'Castrado',
                  value: _neutered,
                  items: _yesNoOptions,
                  onChanged: (value) => setState(() => _neutered = value!),
                ),
                const SizedBox(height: 12),
                _buildDropdown(
                  label: 'Vacinado',
                  value: _vaccinated,
                  items: _yesNoOptions,
                  onChanged: (value) => setState(() => _vaccinated = value!),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    labelText: 'Localização',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_on_outlined),
                    hintText: 'Ex.: Recife - PE',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe a localização';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _aboutController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Sobre o pet',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Descreva o pet';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _whatsappController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'WhatsApp para contato',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone_outlined),
                    hintText: 'Ex.: 5581999999999',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe o WhatsApp';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _imageUrlController,
                  keyboardType: TextInputType.url,
                  decoration: const InputDecoration(
                    labelText: 'URL da foto (opcional)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.image_outlined),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isSaving ? null : _handleSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF751F),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  child: _isSaving
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.4,
                            color: Colors.white,
                          ),
                        )
                      : const Text('Cadastrar pet'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(fontFamily: 'Nunito'),
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
