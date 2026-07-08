class VarvaraPersonality {
  final String id;
  final String name;
  final String description;
  final String voiceGender;
  final String characterType;
  final Map<String, String> responses;
  final bool isActive;

  VarvaraPersonality({
    required this.id,
    required this.name,
    required this.description,
    required this.voiceGender,
    required this.characterType,
    required this.responses,
    required this.isActive,
  });

  static const List<VarvaraPersonality> defaultPersonalities = [
    VarvaraPersonality(
      id: 'calm',
      name: 'Спокойная',
      description: 'Уравновешенная помощница',
      voiceGender: 'female',
      characterType: 'calm',
      responses: {
        'greeting': 'Добрый день. Я готова помочь.',
        'help': 'Чем я могу вам помочь?',
        'error': 'Произошла ошибка. Давайте попробуем ещё раз.',
      },
      isActive: true,
    ),
  ];
}
