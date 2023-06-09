# Platebook
This is the front-end repository of our application. For the back-end repository, please visit [plate-book-be](https://github.com/andrew-bingham1/plate-book-be).\
\
Platebook is a license plate based social media website where anonymous users can share images of notable driving, make posts, and make comments on them. This serves as an alternative method for drivers to share their thoughts and hopefully reduce road aggression. By providing a platform for drivers to express themselves, it may provide a chance for drivers to express gratitude, address traffic safety concerns, or pursue missed connections.

## How It Works
Platebook is a social media platform that revolves around license plates.

Users must log in using Google OAuth to create new posts or comments.\
Visitors are free to peruse the site.

Users can create a post and attach it to a new license plate or attach the post directly to an existing license plate.\
When creating a post, users can also attach a photo or provide the location of the incident the post is referring to.\
If a photo is provided, the photo will be displayed on the post's show page.\
If a location is provided, a marker that links to the posts's show page will be placed on the map in the landing page at the provided location.\
Users can leave comments on posts.\
Users can follow plates.\
Users can view their posts, comments, and followed plates on their dashboard.\
Users can search for specific plates or posts using the search box.

##OAuth
This app makes use of the 'omniauth-google-oauth2' gem.
The 'omniauth-google-oauth2' gem is a specific strategy for OmniAuth that implements Google OAuth 2.0.

*Step 1: The user clicks on the 'Login' button, which triggers a GET request to the "/auth/google_oauth2" route 

*Step 2: The OmniAuth middleware intercepts this request and redirects the user to the Google sign-in page. It attaches some parameters to the URL, such as 'client_id' (your app's ID from Google), 'redirect_uri' (where Google should redirect users after they decide whether or not to authenticate your app).

*Step 3: User Authenticates: The user inputs their Google username and password, then decides whether they want to grant platebook the permissions it requests.

*Step 4: Google Redirects Back: If the user chooses to authenticate, Google redirects them back to platebook's 'redirect_uri', including an authorization 'code' parameter.

*Step 5: Platebook Retrieves User Info: The OmniAuth middleware intercepts this request, extracts the authorization code, and exchanges it for an access token by making a POST request to Google. The response of this request includes the user's info, such as uid, email, etc., and an access token.

*Step 6: OmniAuth Calls Callback Function and then OmniAuth calls the create method in our application where you can use the user's info to sign the user in, sign them up, etc.

## Language Filtering
Platebook uses Google Cloud's Perspective API sentiment analysis to evaluate incoming posts and comments on three factors:
- Insult
- Identity Attack
- Threat

If any user attempts to create a post or comment that rates too highly in probability on any of these scales, the user is informed that the comment does not meet community guidelines and the comment/post will not be created.

## Preview

![Screenshot 2023-06-08 at 5 28 47 PM](https://github.com/DysonBreakstone/plate-book-fe/assets/121531791/df28a60a-ec80-441f-9df6-cfe565d85af2)

![Screenshot 2023-06-08 at 5 29 03 PM](https://github.com/DysonBreakstone/plate-book-fe/assets/121531791/1efafa45-c328-4b3f-9cbe-fbccfb806ed0)

![Screenshot 2023-06-08 at 5 29 14 PM](https://github.com/DysonBreakstone/plate-book-fe/assets/121531791/c50a7089-2f64-4789-83f8-76d997d02a7e)

![Screenshot 2023-06-08 at 5 29 24 PM](https://github.com/DysonBreakstone/plate-book-fe/assets/121531791/f8495c4b-d46f-4687-aab6-9241025f724f)

![Screenshot 2023-06-08 at 5 41 03 PM](https://github.com/DysonBreakstone/plate-book-fe/assets/121531791/2302f299-4336-4b79-86fb-ad2e4bf47f04)


## Built Using
* Rails 7.0.5
* Ruby 3.1.1
* Bootstrap 5
* AWS S3 (hosts user images)
* Routes documented Swagger

## Deployment
The front-end repository was deployed using\
The back-end repository was deployed using\
The database is hosted was deployed using

## How to Install Locally
Ensure you have the correct versions of Ruby and Ruby on Rails installed.

1. In your terminal, navigate to the directory you would like to host the repository in.

2. Clone the project repository:
```
git clone git@github.com:DysonBreakstone/plate-book-fe.git
```
3. Clone [plate-book-be](https://github.com/andrew-bingham1/plate-book-be):
```
git clone git@github.com:andrew-bingham1/plate-book-be.git
```
4. Run `bundle install` in both repositories in your terminal to install project gems.

5. In the back-end repository, run these commands to initialize the databases and set up database structure:

```
rails db:drop
rails db:create
rails db:migrate
```

6. Run the `bundle exec rspec` command to see all of the Rspec tests run and ensure the program is running properly.

7. Run `rails s` in both the back-end and front-end repositories.

8. Navigate to [localhost:3000](http://localhost:3000/) in your browser to explore!

## Testing

- To run tests for this app, type the following command in your terminal from inside the cloned project folder:

```
bundle exec rspec spec
```

This application uses the `Simplecov` gem to monitor test coverage. Current coverage is at 100% for the back-end and 98% for the front-end.

## Contributors

Andrew Bingham

- [GitHub](https://github.com/andrew-bingham1)
- [LinkedIn](https://www.linkedin.com/in/andrew-bingham1/)

Branden Ge

- [GitHub](https://github.com/brandenge)
- [LinkedIn](https://www.linkedin.com/in/brandenge/)

Dyson Breakstone

- [GitHub](https://github.com/DysonBreakstone/plate-book-fe)
- [LinkedIn](https://www.linkedin.com/in/dyson-breakstone-4978291a2)

Young Heon Koh

- [GitHub](https://github.com/kohyoungheon)
- [LinkedIn](https://www.linkedin.com/in/kohyoungheon/)
