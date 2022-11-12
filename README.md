# country_app

This is a country app built with flutter which makes use of the Rest country API. It uses API calls to search, fetch and display a list of all available countries and certain information about each of them.
The app also makes use of GetX for state management to share data received from the API call to various parts of the application.
The app has a Search bar that enables users search through the long list of country for a specific country/countries they need information on.The searching can be done by the names of the countries, the capitals of the countries.
It also has a filter that can be adjusted to suit what the users want. The filter groups according to continents or times zone or possibly both.
It also has a language setting option with various languages which the users can pick the most suitable one for them. There is a also the toggle theme features which can be used to switch the UI between Light and dark modes.various


## Libraries Used

Get: A flutter state management library application which I used to hold and pass data across the application.

Get Storage: Get Storage: It is a storage library which was used in the application to store the bool values of my theme mode for the purpose of toggling the themes without issues.

Font awesome: It is a library which contains beautiful icons which I used for the application

https: It is a networking library which I for API calling from the Country API


I faced challenges when creating the application were the language translation functionality for the app and also filtering the list through categories.



- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
