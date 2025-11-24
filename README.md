# Picturator

App for generating images from text descriptions.

## Project structure:

### Domain 
- `entities/` - business entities
- `repositories/` - repositories interfaces

### Data 
- `repositories/` - repositories implementation

### Presentation 
- `screens/` - app screens
- `widgets/` - re-used widgets
- `bloc/` - BLoC for state management

### Core 
- `constants/` - app constants
- `theme/` - app themes
- `di/` - dependency injection

## Setup
- git clone git@github.com:g1er/picturator.git

## Launch

```bash
flutter run
```
## Generate Picture Error reproducing
- Error appears every 4th time the "Try Another" button is pressed (including initial screen generating)
