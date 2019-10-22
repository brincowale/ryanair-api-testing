from behave import *
from features.creator import Creator

@given('the client bookings')
def step_given_the_client(context):
    context.resource = Creator()

@given('the user id from the {email}')
def step_given_the_name(context, email):
    context.user_id = context.resource.get_user_id_by(email)

@given('the flight date {date}')
def step_given_the_email(context, date):
    context.date = date

@given('the departure airport {from_IATA}')
def step_given_the_email(context, from_IATA):
    context.from_IATA = from_IATA

@given('the arrival airport {to_IATA}')
def step_given_the_email(context, to_IATA):
    context.to_IATA = to_IATA

@when('I add the booking')
def step_i_create_a_user(context):
    booking = [
        context.user_id,
        context.date,
        context.from_IATA,
        context.to_IATA
    ]
    context.response = context.resource.create_booking(booking)

@then('the response code is {code:d}')
def step_the_response_code_is(context, code):
    assert context.response.status_code == code

