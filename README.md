Here's an updated README for your Flutter diary app project. It includes setup instructions, app features, and a brief overview of the technology used.

```markdown
# Diary App

A personal diary application built with Flutter. This app allows users to add, view, edit, and delete diary entries. It includes features for searching entries and provides a theme switcher to toggle between light and dark modes. 

## Features

- **Home Screen**: View a list of diary entries with titles and timestamps. Search entries by title or content.
- **Add/Edit Entry Screen**: Add new diary entries or edit existing ones with title and content.
- **View Entry Screen**: View the full content of a selected diary entry, with options to edit or delete.
- **Search Functionality**: Search for diary entries by title or content.
- **Themes**: Toggle between light and dark modes.
- **Animations**: Smooth transitions for screen navigation and list updates.
- **Data Persistence**: Entries are saved and loaded using `shared_preferences`, ensuring data is preserved across app restarts.

## Getting Started

To get started with this project, you'll need to set up Flutter on your local machine. Follow these instructions to run the app:

### Prerequisites

1. [Install Flutter](https://docs.flutter.dev/get-started/install)
2. [Set up an editor](https://docs.flutter.dev/get-started/editor)
3. [Set up your device](https://docs.flutter.dev/get-started/test-drive)

### Clone the Repository

```bash
git clone https://github.com/yourusername/diary_app.git
cd diary_app
```

### Install Dependencies

```bash
flutter pub get
```

### Run the App

Connect a device or start an emulator and run:

```bash
flutter run
```

## Directory Structure

- `lib/`
  - `main.dart`: Entry point of the application.
  - `providers/`: Contains `diary_provider.dart` for managing state and data persistence.
  - `models/`: Contains `diary_entry.dart` for data model definitions.
  - `screens/`: Contains screen widgets including `home_screen.dart`, `add_edit_entry_screen.dart`, and `view_entry_screen.dart`.

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [Flutter](https://flutter.dev) for providing a powerful framework for building natively compiled applications.
- [shared_preferences](https://pub.dev/packages/shared_preferences) for local data storage.

For more information, check out the [official Flutter documentation](https://docs.flutter.dev/).

```

Replace `https://github.com/yourusername/diary_app.git` with the actual URL of your GitHub repository. You can also customize or add more sections based on your project needs.
