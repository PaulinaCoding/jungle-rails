# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Final Product

!['Soldout button'](https://github.com/PaulinaCoding/jungle-rails/blob/feature/polishing_before_submitting/docs/Soldout_button.png)
!['Login page'](https://github.com/PaulinaCoding/jungle-rails/blob/feature/polishing_before_submitting/docs/Login_page.png)

!['Empty cart message'](https://github.com/PaulinaCoding/jungle-rails/blob/feature/polishing_before_submitting/docs/empty_cart_message.png)

!['Order confirmation message'](https://github.com/PaulinaCoding/jungle-rails/blob/feature/polishing_before_submitting/docs/order_confirmation_message.png)

!['Product page display when logged in'](https://github.com/PaulinaCoding/jungle-rails/blob/feature/polishing_before_submitting/docs/product_display_when_loged_in.png)

!['Product page display when logged out'](https://github.com/PaulinaCoding/jungle-rails/blob/feature/polishing_before_submitting/docs/display_when_logged_out.png)

!['Categories page'](https://github.com/PaulinaCoding/jungle-rails/blob/feature/polishing_before_submitting/docs/Categories_page.png)

!['Alert when trying to add category when not logged in'](https://github.com/PaulinaCoding/jungle-rails/blob/feature/polishing_before_submitting/docs/When_trying_to_add_new_category_not_logged.png)


