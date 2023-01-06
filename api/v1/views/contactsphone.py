#!/usr/bin/python3
""" objects that handle all default RestFul API actions for States """
from models.contactsphone import ContactsPhone
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request
from flasgger.utils import swag_from


@app_views.route('/contactsphone', methods=['GET'], strict_slashes=False)
@swag_from('documentation/contactsphone/get_contactsphone.yml', methods=['GET'])
def get_contactsphone():
    """
    Retrieves the list of all ContactsPhone objects
    """
    all_contactsphone = storage.all(ContactsPhone).values()
    list_contactsphone = []
    for phone in all_contactsphone:
        list_contactsphone.append(phone.to_dict())
    return jsonify(list_contactsphone)


@app_views.route('/contactsphone/<contactsphone_id>', methods=['GET'], strict_slashes=False)
@swag_from('documentation/contactsphone/get_id_contactsphone.yml', methods=['GET'])
def get_phone(contactsphone_id):
    """ Retrieves a specific contacts phone """
    phone = storage.get(ContactsPhone, contactsphone_id)
    if not phone:
        abort(404)
    return jsonify(phone.to_dict())


@app_views.route('/contactsphone/<contactsphone_id>', methods=['DELETE'],
                 strict_slashes=False)
@swag_from('documentation/contactsphone/delete_contactsphone.yml', methods=['DELETE'])
def delete_phone(contactsphone_id):
    """
    Deletes a ContactsPhone Object
    """

    phone = storage.get(ContactsPhone, contactsphone_id)

    if not phone:
        abort(404)

    storage.delete(phone)
    storage.save()

    return make_response(jsonify({}), 200)


@app_views.route('/contactsphone', methods=['POST'], strict_slashes=False)
@swag_from('documentation/contactsphone/post_contactsphone.yml', methods=['POST'])
def post_contactsphone():
    """
    Creates an Address
    """
    if not request.get_json():
        abort(400, description="Not a JSON")

    if 'contactsphone_name' not in request.get_json():
        abort(400, description="Contacts Phone Missing")

    data = request.get_json()
    instance = ContactsPhone(**data)
    instance.save()
    return make_response(jsonify(instance.to_dict()), 201)


@app_views.route('/contactsphone/<contactsphone_id>', methods=['PUT'], strict_slashes=False)
@swag_from('documentation/contactsphone/put_contactsphone.yml', methods=['PUT'])
def put_phone(contactsphone_id):
    """
    Updates a Contacts Phone
    """
    phone = storage.get(ContactsPhone, contactsphone_id)

    if not phone:
        abort(404)

    if not request.get_json():
        abort(400, description="Not a JSON")

    ignore = ['id', 'created_at', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in ignore:
            setattr(phone, key, value)
    storage.save()
    return make_response(jsonify(phone.to_dict()), 200)
