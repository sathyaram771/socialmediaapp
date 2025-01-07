# Post and Comments Manager

## Description
A Flutter project for managing posts and comments. This app interacts with an API to display a list of posts, view detailed post information, and manage comments for each post. Users can add new posts and comments seamlessly with real-time updates.

## Features
- View a list of posts fetched from an API.
- Add a new post with a title and body.
- View detailed post information, including comments.
- Add new comments to any post.
- User-friendly interface with profile navigation icon.

## Technologies Used
- **Flutter**: For building the UI and managing state.
- **Dio**: For API integration and HTTP requests.
- **GetX**: For state management and navigation.

## Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/sathyaram771/socialmediaapp
   ```
2. Navigate to the project directory:
   ```bash
   cd socialmediaapp
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the project:
   ```bash
   flutter run
   ```

## API Endpoints
This app uses the [JSONPlaceholder](https://jsonplaceholder.typicode.com/) API.
- **Fetch Posts**: `/posts`
- **Fetch Comments**: `/posts/{postId}/comments`
- **Add Post**: `/posts`
- **Add Comment**: `/posts/{postId}/comments`

## File Structure
```
socialmediaapp/
|-- lib/
|   |-- main.dart
|   |-- api/
|   |   |-- api_service.dart   
|   |-- models/
|   |   |-- post_model.dart  
|   |   |-- comment_model.dart
|   |   |-- user_model.dart
|   |   |-- app_data.dart 
|   |-- screens/
|   |   |-- home_screen.dart   
|   |   |-- create_post_screen.dart 
|   |   |-- post_details_screen.dart 
|   |   |-- create_post_screen.dart
|   |--exceptions/
|   |   |-- app_exceptions.dart
|-- pubspec.yaml               
```

## Screenshots

1. **Home Screen**: Displays a list of posts with options to view details or add a new post.
2. **Post Details Screen**: View post details, existing comments, and add new comments.
3. **Create Post Screen**: Add a new post with a title and body.

(Add screenshots here if available)

## How to Contribute
1. Fork this repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Description of changes"
   ```
4. Push the branch:
   ```bash
   git push origin feature-name
   ```
5. Create a pull request.

## Acknowledgments
- Thanks to [JSONPlaceholder](https://jsonplaceholder.typicode.com/) for providing the free API.

## Contact
For any issues or suggestions, please reach out at [sathyaalh3@gmail.com].
