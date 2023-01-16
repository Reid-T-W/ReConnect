#!/usr/bin/python3
""" objects that handle all default RestFul API actions for States """
from models.contacts import Contacts
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request
from flasgger.utils import swag_from


@app_views.route('/contacts', methods=['GET'], strict_slashes=False)
@swag_from('documentation/contacts/get_contacts.yml', methods=['GET'])
def get_contacts():
    """
    Retrieves the list of all Contact objects
    """
    # Fetching all contacts from the database
    all_contacts = storage.all(Contacts).values()
    list_contacts = []
    for contact in all_contacts:
        # Converting contact into a dict and adding it to a list
        list_contacts.append(contact.to_dict())
    return jsonify(list_contacts)


@app_views.route('/contacts/<contacts_id>', methods=['GET'], strict_slashes=False)
@swag_from('documentation/contacts/get_id_contacts.yml', methods=['GET'])
def get_contact(contacts_id):
    """ Retrieves a specific Contact """
    contact = storage.get(Contacts, contacts_id)
    # If contact does not exist in the database, abort with a 404
    if not contact:
        abort(404)

    return jsonify(contact.to_dict())


@app_views.route('/contacts/<contacts_id>', methods=['DELETE'],
                 strict_slashes=False)
@swag_from('documentation/contacts/delete_contacts.yml', methods=['DELETE'])
def delete_contacts(contacts_id):
    """
    Deletes a Contacts Object
    """
    # Get contact object by id
    contact = storage.get(Contacts, contacts_id)
    # If contact does not exist abort with a 404
    if not contact:
        abort(404)
    # Delete the contact
    storage.delete(contact)
    storage.save()

    return make_response(jsonify({}), 200)


@app_views.route('/contacts', methods=['POST'], strict_slashes=False)
@swag_from('documentation/contacts/post_contacts.yml', methods=['POST'])
def post_contacts():
    """
    Creates an Address
    """
    # Check if the request is a proper json
    if not request.get_json():
        abort(400, description="Not a JSON")
    # Check if the mandatory fiels "contacts_name" is in request json
    if 'contacts_name' not in request.get_json():
        abort(400, description="Contacts name Missing")

    data = request.get_json()
    # Create a Contacts instance
    instance = Contacts(**data)
    instance.save()
    return make_response(jsonify(instance.to_dict()), 201)


@app_views.route('/contacts/<contacts_id>', methods=['PUT'], strict_slashes=False)
@swag_from('documentation/contacts/put_contacts.yml', methods=['PUT'])
def put_contacts(contacts_id):
    """
    Updates a Contact
    """
    contact = storage.get(Contacts, contacts_id)

    # If contact does not exist abort with a 404
    if not contact:
        abort(404) 
    
    # Check if the request is a proper json
    if not request.get_json():
        abort(400, description="Not a JSON")

    # Ensuring that id, created_at, updated_at are not modifiable
    ignore = ['id', 'created_at', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in ignore:
            # Modifying the attribute
            setattr(contact, key, value)
    storage.save()
    return make_response(jsonify(contact.to_dict()), 200)
