# Exercise - Rick and Morty

The main goal of this mini-app is to display images based on user queries using the Rick and Morty API based on GraphQl.

Please check the Rick and Morty API documentation: https://rickandmortyapi.com/documentation.

- Requests should be done using [graphql plugin](https://pub.dev/packages/graphql)
- You have to create a model for response.
- Use Cubit to provide clean State Management.
- Create a separate class which will be responsible for making requests to API.
- Display info about characters in a list.
- Remember about showing the progress indicator (during network call) and error handling (for example when there is no internet connection).
- **Remember about clean architecture.**

[Here](https://i.imgur.com/xkrYNDA.mp4) you can find example result.

## Bonus - Pagination

As a bonus try to use `info` and `next` parameters in GraphQL query:
```
info {
      next
    }
```

It will give you information about next page ready to fetch, let's create *paginated* list as [here](https://i.imgur.com/zkkzPIf.mp4).


## How to Submit

1. Commit your changes when you finish exercise.
2. Push your branch to Github.
3. Copy the URL to your Pull Request from the browser location bar.
4. Paste this URL in the [exercise submission form](https://docs.google.com/forms/d/e/1FAIpQLSd3wK628-vQ0zW77Tn1kHUigmTaJuqC5XMaIglFigKl9_INYw/viewform).
