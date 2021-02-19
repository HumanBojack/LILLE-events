# Lille Events
This repo was made for a school project, **it's not finished** (*and will probably never be*)
**The visible part of the website is written in french**

It's a simple site where you can create a profile and then submit one (or many) event(s), that needs to be approved by an admin. Find it [here](https://lille-events.herokuapp.com/) (heroku doesn't stock images so it's not great)
This project made me use devise, stripe and active storage, that i never used in the past.
***
## To make it work :
### Install rails and its gems
You will need to be using rails **2.7.1**
Then, you need to type :
```
 bundle install
```
It will install *all of the gems* that you need to make this project run.

### Connect your gmail account
Your gmail account will send mails for createad account, lost passwords, event participations and validated events.

To do that, create a file named `.env` in the root directory of the project.
In that file, write :
>GMAIL_LOGIN='your_gmail_email'
>
>GMAIL_PWD='your_gmail_password'

You can also add `STRIPE_PUBLIC`and `STRIPE_PRIVATE` api keys if you want to make the payment functionnal.

### Create the database
After that, you **need** to type these commands:
```
 rails db:create
```
```
 rails db:migrate
```
This one is optional, it will create fake accounts and posts
```
 rails db:seed
```

Once it's done, everything should be working ! (note that seeded posts will not appear, as an admin needs to approve them)
***
## If you want to make your account admin
Create an account, then go to your terminal and type :
```
 rails console
```
```
 u = User.find_by(email: "email_you_entered")
 u.update(is_admin: true)
 ```
 To exit the rails console :
 ```
 quit
 ```
 Your account should now be admin, and you should also see a section named "*Espace admin*" in the navbar, where you will be able to accept or delete events.
