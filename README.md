# Picturator

Flutter приложение для генерации изображений из текстовых описаний.

## Структура проекта

Проект следует принципам Clean Architecture и разделен на следующие слои:

### Domain (Доменный слой)
- `entities/` - бизнес-сущности
- `repositories/` - интерфейсы репозиториев

### Data (Слой данных)
- `repositories/` - реализации репозиториев

### Presentation (Слой представления)
- `screens/` - экраны приложения
- `widgets/` - переиспользуемые виджеты
- `bloc/` - BLoC для управления состоянием

### Core (Общие компоненты)
- `constants/` - константы приложения
- `theme/` - тема приложения
- `di/` - dependency injection

## Установка

1. Установите зависимости:
```bash
flutter pub get
```

2. Добавьте изображения в папку `assets/images/`:
   - `image_1.png`
   - `image_2.png`
   - `image_3.png`
   - `image_4.png`
   - `image_5.png`
   - `image_6.png`
   - `image_7.png`

## Запуск

```bash
flutter run
```

## Особенности

- Clean Architecture
- State Management с flutter_bloc
- Плавные анимации переходов
- Обработка ошибок
- Null safety
- Современный дизайн

