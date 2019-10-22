from behave import *
from features.creator import Creator

@given('the client')
def step_given_the_client(context):
    context.resource = Creator()

@given('the name {name}')
def step_given_the_name(context, name):
    context.name = name

@given('the email {email}')
def step_given_the_email(context, email):
    context.email = email

@when('I create a user')
def step_i_create_a_user(context):
    context.response = context.resource.create_user(context.name, context.email)

@then('the response code is {code:d}')
def step_the_response_code_is(context, code):
    assert context.response.status_code == code

@then('the user id is valid')
def step_the_response_code_is(context):
    is_valid = context.resource.is_valid_id(context.email, context.response.json()['id'])
    assert is_valid
